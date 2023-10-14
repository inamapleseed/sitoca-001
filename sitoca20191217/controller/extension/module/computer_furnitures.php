<?php
class ControllerExtensionModuleComputerFurnitures extends Controller {
	public function index() {
		$array = array(
            'oc' => $this,
            'heading_title' => 'Computer Furnitures',
            'modulename' => 'computer_furnitures',
            'fields' => array(
                array('type' => 'text', 'label' => 'Title', 'name' => 'title'),
                array('type' => 'image', 'label' => 'Background Image', 'name' => 'bg_image'),
            ),
        );
        $this->modulehelper->init($array);    
	}
}
