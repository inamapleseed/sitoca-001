<?php
class ControllerExtensionModuleDataCentreSolutions extends Controller {
	public function index() {
		$array = array(
            'oc' => $this,
            'heading_title' => 'Data Centre Solutions',
            'modulename' => 'data_centre_solutions',
            'fields' => array(
                array('type' => 'text', 'label' => 'Title', 'name' => 'title'),
                array('type' => 'image', 'label' => 'Background Image', 'name' => 'bg_image'),
            ),
        );
        $this->modulehelper->init($array);    
	}
}
