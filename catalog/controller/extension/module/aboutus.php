<?php
class ControllerExtensionModuleAboutus extends Controller {
    public function index() {
        // Handle custom fields
        $oc = $this;
        $language_id = $this->config->get('config_language_id');
        $modulename  = 'aboutus';
        $this->load->library('modulehelper');
        $Modulehelper = Modulehelper::get_instance($this->registry);

        $data['title'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'title' );
        $data['text'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'text' );
        $data['image'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'image' );
        $data['bg_image'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'bg_image' );
        $data['list'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'list' );

        $data['s2_list'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 's2_list' );
        $data['s2_img_list'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 's2_img_list' );
        return $this->load->view('extension/module/aboutus', $data);
    }
}