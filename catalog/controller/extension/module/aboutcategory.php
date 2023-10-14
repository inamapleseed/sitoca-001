<?php
class ControllerExtensionModuleAboutcategory extends Controller {
	public function index() {
		// Handle custom fields
		$oc = $this;
		$language_id = $this->config->get('config_language_id');
		$modulename  = 'aboutcategory';
	    $this->load->library('modulehelper');
	    $Modulehelper = Modulehelper::get_instance($this->registry);

		$data['bg_image'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'bg_image' );
		$data['items'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'items' );


		return $this->load->view('extension/module/aboutcategory', $data);
	}
}