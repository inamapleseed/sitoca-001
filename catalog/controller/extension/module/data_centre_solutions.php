<?php
class ControllerExtensionModuleDataCentreSolutions extends Controller {
	public function index($setting) {
		$oc = $this;
		$language_id = $this->config->get('config_language_id');
		$modulename  = 'data_centre_solutions';
    $this->load->library('modulehelper');

    $Modulehelper = Modulehelper::get_instance($this->registry);
		$data = array(
			'title'       	=> $Modulehelper->get_field ( $oc, $modulename, $language_id, 'title' ),
			'bg_image'     	=> $Modulehelper->get_field ( $oc, $modulename, $language_id, 'bg_image' ),
		);

		$data['categories'] = $this->getCategoryFilter();

		return $this->load->view('extension/module/data_centre_solutions', $data);
	}

	private function getCategoryFilter(){
		
		$url = "";
		$route = 'product/category';
		
		$path = isset($this->request->get['path'])?$this->request->get['path']:0;
		$paths = explode('_', $path);

		$this->load->model('catalog/category');
		
		$categories = $this->model_catalog_category->getCategories(1);
		
		$return_categories  = array();
		
		foreach($categories as $category){
			$child_1 = array();
			
			$active = '';
			
			$child_1_categories = $this->model_catalog_category->getCategories($category['category_id']);
			
			foreach($child_1_categories as $child_1_category){
				$child_2 = array();
				
				$active_1 = '';
				
				$child_2_categories = $this->model_catalog_category->getCategories($child_1_category['category_id']);
				
				foreach($child_2_categories as $child_2_category){
					
					$active = $active_1 = $active_2 = in_array($child_2_category['category_id'], $paths)?'active':'';
					
					$path = $category['category_id'] . '_' . $child_1_category['category_id'] . '_' . $child_2_category['category_id'];

					$child_2[] = array(
							'category_id'		=>	$child_2_category['category_id'],
							'active'			=>	$active_2,
							'name'				=>	$child_2_category['name'],
							'path'				=>	$path,
							'href'				=>	$this->url->link($route, 'path=' . $path)
					);
				}
				
				//=====================
				
				$active = $active_1 = $active_1?'active':(in_array($child_1_category['category_id'], $paths)?'active':'');

				$path = $category['category_id'] . '_' . $child_1_category['category_id'];
				
				$child_1[] = array(
					'category_id'		=>	$child_1_category['category_id'],
					'active'				=>	$active_1,
					'name'				=>	$child_1_category['name'],
					'image'				=>	$child_1_category['image'],
					'path'				=>	$path,
					'href'				=>	$this->url->link($route, 'path=' . $path . $url),
					'child'				=>	$child_2
				);
				
			}
			
			// ====================

			$active = $active?'active':(in_array($category['category_id'], $paths)?'active':'');

			$path = $category['category_id'];

			$return_categories[] = array(
				'category_id'		=>	$category['category_id'],
				'active'				=>	$active,
				'name'				=>	$category['name'],
				'image'				=>	$category['image'],
				'path'				=>	$path,
				'href'				=>	$this->url->link($route, 'path=' . $path . $url),
				'child'				=>	$child_1
			);
		}
		return $return_categories;
	}
}