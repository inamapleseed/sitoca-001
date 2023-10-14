<?php
class ControllerExtensionModuleAboutcategory extends Controller {
	public function index() {
		$array = array(
            'oc' => $this,
            'heading_title' => 'About Category',
            'modulename' => 'aboutcategory',
            'fields' => array(
                array('type' => 'image', 'label' => 'Background Image', 'name' => 'bg_image'),
                
                array('type' => 'repeater', 'label' => 'Items', 'name' => 'items',
                    'fields' => array(
                        array('type' => 'text', 'label' => 'Title', 'name' => 'title'),
                array('type' => 'textarea', 'label' => 'Main Description 1', 'name' => 'text'),
                array('type' => 'image', 'label' => 'Image', 'name' => 'image'),
                array('type' => 'text', 'label' => 'Button', 'name' => 'button'),
                array('type' => 'text', 'label' => 'URL', 'name' => 'url'),
                    )
                ),
            ),
        );
        $this->modulehelper->init($array);    
	}
}
