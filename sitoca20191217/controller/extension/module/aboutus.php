<?php
class ControllerExtensionModuleAboutus extends Controller {
	public function index() {
		$array = array(
            'oc' => $this,
            'heading_title' => 'About Us',
            'modulename' => 'aboutus',
            'fields' => array(
                array('type' => 'text', 'label' => 'Title', 'name' => 'title'),
                array('type' => 'text', 'label' => 'Text', 'name' => 'text'),
                array('type' => 'image', 'label' => 'Image', 'name' => 'image'),
                array('type' => 'image', 'label' => 'Background Image', 'name' => 'bg_image'),
                array('type' => 'repeater', 'label' => 'List', 'name' => 'list',
                    'fields' => array(
                        array('type' => 'text', 'label' => 'Text', 'name' => 'name'),
                    )
                ),
                array('type' => 'repeater', 'label' => 'Section 2 List', 'name' => 's2_list',
                    'fields' => array(
                        array('type' => 'text', 'label' => 'Title', 'name' => 's2_title'),
                        array('type' => 'textarea', 'label' => 'Description', 'name' => 's2_desc', 'ckeditor' =>true),
                    )
                ),
                array('type' => 'repeater', 'label' => 'Section 2 List', 'name' => 's2_img_list',
                    'fields' => array(
                        array('type' => 'image', 'label' => 'Image', 'name' => 's2_img'),
                    )
                ),
            ),
        );
        $this->modulehelper->init($array);    
	}
}