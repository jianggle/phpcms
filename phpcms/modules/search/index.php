<?php
defined('IN_PHPCMS') or exit('No permission resources.');
pc_base::load_sys_class('form','',0);
pc_base::load_sys_class('format','',0);
class index {
	function __construct() {
		$this->db = pc_base::load_model('search_model');
		$this->content_db = pc_base::load_model('content_model');
	}

	/**
	 * 关键词搜索
	 */
	public function init() {
		//获取siteid
		$siteid = isset($_REQUEST['siteid']) && trim($_REQUEST['siteid']) ? intval($_REQUEST['siteid']) : 1;
		$SEO = seo($siteid);

		//搜索配置
		$search_setting = getcache('search');
		$setting = $search_setting[$siteid];

		$search_model = getcache('search_model_'.$siteid);
		$type_module = getcache('type_module_'.$siteid);

		if(isset($_GET['q'])) {
			if(trim($_GET['q'])=='') {
				header('Location: '.APP_PATH.'index.php?m=search');exit;
			}
			$typeid = empty($_GET['typeid']) ? 0 : intval($_GET['typeid']);
			$time = empty($_GET['time']) || !in_array($_GET['time'],array('all','day','month','year','week')) ? 'all' : trim($_GET['time']);
			$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
			$pagesize = 10;
			$q = safe_replace(trim($_GET['q']));
			$q = new_html_special_chars(strip_tags($q));
			$q = str_replace('%', '', $q);	//过滤'%'，用户全文搜索
			$search_q = $q;	//搜索原内容

			$sql_time = $sql_tid = '';
			if($typeid) $sql_tid = ' AND typeid = '.$typeid;
			//按时间搜索
			if($time == 'day') {
				$search_time = SYS_TIME - 86400;
				$sql_time = ' AND adddate > '.$search_time;
			} elseif($time == 'week') {
				$search_time = SYS_TIME - 604800;
				$sql_time = ' AND adddate > '.$search_time;
			} elseif($time == 'month') {
				$search_time = SYS_TIME - 2592000;
				$sql_time = ' AND adddate > '.$search_time;
			} elseif($time == 'year') {
				$search_time = SYS_TIME - 31536000;
				$sql_time = ' AND adddate > '.$search_time;
			} else {
				$search_time = 0;
				$sql_time = '';
			}
			if($page==1 && !$setting['sphinxenable']) {
				//精确搜索
				$commend = $this->db->get_one("`siteid`= '$siteid' $sql_tid $sql_time AND `data` like '%$q%'");
			} else {
				$commend = '';
			}
			//如果开启sphinx
			if($setting['sphinxenable']) {
				$sphinx = pc_base::load_app_class('search_interface', '', 0);
				$sphinx = new search_interface();

				$offset = $pagesize*($page-1);
				$res = $sphinx->search($q, array($siteid), array($typeid), array($search_time, SYS_TIME), $offset, $pagesize, '@weight desc');
				$totalnums = $res['total'];
				//如果结果不为空
				if(!empty($res['matches'])) {
					$result = $res['matches'];
				}
			} else {
				$sql = "`siteid`= '$siteid' $sql_tid $sql_time AND `data` like '%$q%'";
				$result = $this->db->listinfo($sql, 'searchid DESC', $page, 10);
			}

			//如果结果不为空
			if(!empty($result) || !empty($commend['id'])) {
				foreach($result as $_v) {
					if($_v['typeid']) $sids[$_v['typeid']][] = $_v['id'];
				}

				if(!empty($commend['id'])) {
					if($commend['typeid']) $sids[$commend['typeid']][] = $commend['id'];
				}
				$model_type_cache = getcache('type_model_'.$siteid,'search');
				$model_type_cache = array_flip($model_type_cache);
				$data = array();
				foreach($sids as $_k=>$_val) {
					$tid = $_k;
					$ids = array_unique($_val);

					$where = to_sqls($ids, '', 'id');
					//获取模型id
					$modelid = $model_type_cache[$tid];

					//是否读取其他模块接口
					if($modelid) {
						$this->content_db->set_model($modelid);
						$datas = $this->content_db->select($where, '*');
					}
					$data = array_merge($data,$datas);
				}
				$pages = $this->db->pages;
				$totalnums = $this->db->number;

				//如果分词结果为空
				if(!empty($segment_q)) {
					$replace = explode(' ', $segment_q);
					foreach($replace as $replace_arr_v) {
						$replace_arr[] =  '<font color=red>'.$replace_arr_v.'</font>';
					}
					foreach($data as $_k=>$_v) {
						$data[$_k]['title'] = str_replace($replace, $replace_arr, $_v['title']);
						$data[$_k]['description'] = str_replace($replace, $replace_arr, $_v['description']);
					}
				} else {
					foreach($data as $_k=>$_v) {
						$data[$_k]['title'] = str_replace($q, '<font color=red>'.$q.'</font>', $_v['title']);
						$data[$_k]['description'] = str_replace($q, '<font color=red>'.$q.'</font>', $_v['description']);
					}
				}
			}
			$execute_time = execute_time();
			$pages = isset($pages) ? $pages : '';
			$totalnums = isset($totalnums) ? $totalnums : 0;
			$data = isset($data) ? $data : '';

			include	template('search','list');
		} else {
			include	template('search','index');
		}
	}

	public function public_get_suggest_keyword() {
		$url = $_GET['url'].'&q='.$_GET['q'];
		$trust_url = array('c8430fcf851e85818b546addf5bc4dd3');
		$urm_md5 = md5($url);
		if (!in_array($urm_md5, $trust_url)) exit;

		$res = @file_get_contents($url);
		if(CHARSET != 'gbk') {
			$res = iconv('gbk', CHARSET, $res);
		}
		echo $res;
	}

	/**
	 * 提示搜索接口
	 * TODO 暂时未启用，用的是google的接口
	 */
	public function public_suggest_search() {
		//关键词转换为拼音
		pc_base::load_sys_func('iconv');
		$pinyin = gbk_to_pinyin($q);
		if(is_array($pinyin)) {
			$pinyin = implode('', $pinyin);
		}
		$this->keyword_db = pc_base::load_model('search_keyword_model');
		$suggest = $this->keyword_db->select("pinyin like '$pinyin%'", '*', 10, 'searchnums DESC');

		foreach($suggest as $v) {
			echo $v['keyword']."\n";
		}
	}
}
?>