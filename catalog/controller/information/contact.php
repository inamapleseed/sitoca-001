<?php
	class ControllerInformationContact extends Controller {
		private $error = array();

		// Add New Post by defining it here
		private $posts = array(
			'company_name'	=>	'',
			'telephone'	=>	'',
			'name'		=>	'',
			'designation'	=>	'',
			'email'		=>	'',
			'homepage_address'	=>	'',
			'product_enquiry'	=>	'',
			'enquiry'	=>	''
		);

		// Add your post value to ignore in the email body content
		private $disallow_in_message_body = array(
			'var_abc_name'
		);

		public function __constructor(){
			$this->posts['name']		= $this->customer->getFirstName() . ' ' . $this->customer->getLastName();
			$this->posts['email']		= $this->customer->getEmail();
			$this->posts['telephone']	= $this->customer->getTelephone();
		}

		public function index() {
			$this->load->language('information/contact');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
				
				$mail = new Mail();
				$mail->protocol = $this->config->get('config_mail_protocol');
				$mail->parameter = $this->config->get('config_mail_parameter');
				$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
				$mail->smtp_username = $this->config->get('config_mail_smtp_username');
				$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
				$mail->smtp_port = $this->config->get('config_mail_smtp_port');
				$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
				
				$mail->setTo($this->config->get('config_email'));
				//$mail->setFrom($this->request->post['email']);
				$mail->setFrom($this->config->get('config_email'));

				$mail->setSender(html_entity_decode($this->request->post['name'], ENT_QUOTES, 'UTF-8'));
				$mail->setSubject(html_entity_decode(sprintf($this->language->get('Enquiry from'), $this->request->post['name']), ENT_QUOTES, 'UTF-8'));
				
				$message = "";
				
				foreach ($this->posts as $post_var => $post_default_value){
					if( !in_array($post_var, $this->disallow_in_message_body) ){
						$message .= $this->language->get('entry_' .$post_var) . ":\n";
						//$message .= $this->request->post[$post_var]??"";
						$message .= $this->request->post[$post_var] ? $this->request->post[$post_var] : "";
						$message .= "\n\n";
					}
				}
				
				$mail->setText($message);
				$mail->send();

				// Pro email Template Mod
				// if($this->config->get('pro_email_template_status')){

				// 	$this->load->model('tool/pro_email');

				// 	$email_params = array(
				// 		'type' => 'admin.information.contact',
				// 		'mail' => $mail,
				// 		'reply_to' => $this->request->post['email'],
				// 		'data' => array(
				// 			'enquiry_subject' => html_entity_decode($this->request->post['company_name'], ENT_QUOTES, 'UTF-8'),
				// 			// 'enquiry_company_name' => html_entity_decode($this->request->post['company_name'], ENT_QUOTES, 'UTF-8'),
				// 			'enquiry_telephone' => html_entity_decode($this->request->post['telephone'], ENT_QUOTES, 'UTF-8'),
				// 			'enquiry_name' => html_entity_decode($this->request->post['name'], ENT_QUOTES, 'UTF-8'),
				// 			'enquiry_designation' => html_entity_decode($this->request->post['designation'], ENT_QUOTES, 'UTF-8'),
				// 			'enquiry_mail' => html_entity_decode($this->request->post['email'], ENT_QUOTES, 'UTF-8'),
				// 			'enquiry_homepage_address' => html_entity_decode($this->request->post['homepage_address'], ENT_QUOTES, 'UTF-8'),
				// 			'enquiry_product_enquiry' => html_entity_decode($this->request->post['product_enquiry'], ENT_QUOTES, 'UTF-8'),
				// 			'enquiry_message' => html_entity_decode($this->request->post['enquiry'], ENT_QUOTES, 'UTF-8'),
				// 			// 'enquiry_message' => html_entity_decode($message, ENT_QUOTES, 'UTF-8'),
				// 		),
				// 	);
					
				// 	$this->model_tool_pro_email->generate($email_params);
				// }
				// else{
					// $mail->send();
				// }
				
				$this->response->redirect($this->url->link('information/contact/success'));
			}
			
			$data['breadcrumbs'] = array();
			
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_home'),
				'href' => $this->url->link('common/home')
			);
			
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('information/contact')
			);
			
			$data['heading_title'] = $this->language->get('heading_title');
			
			$data['text_location'] = $this->language->get('text_location');
			$data['text_store'] = $this->language->get('text_store');
			$data['text_contact'] = $this->language->get('text_contact');
			$data['text_address'] = $this->language->get('text_address');
			$data['text_telephone'] = $this->language->get('text_telephone');
			$data['text_fax'] = $this->language->get('text_fax');
			$data['text_email'] = $this->language->get('text_email');
			$data['text_open'] = $this->language->get('text_open');
			$data['text_comment'] = $this->language->get('text_comment');
			
			$data['button_map'] = $this->language->get('button_map');
			
			$data['button_submit'] = $this->language->get('button_submit');
			
			$data['action'] = $this->url->link('information/contact', '', true);
			
			$this->load->model('tool/image');
			
			$data['store'] = $this->config->get('config_name');
			$data['address'] = nl2br($this->config->get('config_address'));
			
			$data["geocode"] = str_replace(" ", "", $this->config->get('config_geocode'));
			
			$api_key = $this->config->get('config_google_api');
			
			$data['google_map'] = $this->gmap('google_map', $this->config->get('config_address'));
			
			$this->document->addScript("https://maps.googleapis.com/maps/api/js?key=$api_key&callback=gmap", "header", true);
			
			$data['geocode_hl'] = $this->config->get('config_language');
			$data['store_telephone'] = $this->config->get('config_telephone');
			$data['store_email'] = $this->config->get('config_email');
			$data['fax'] = $this->config->get('config_fax');
			$data['open'] = nl2br($this->config->get('config_open'));
			$data['comment'] = $this->config->get('config_comment');
			
			$data['locations'] = array();
			
			$this->load->model('localisation/location');
			
			foreach((array)$this->config->get('config_location') as $location_id) {
				$location_info = $this->model_localisation_location->getLocation($location_id);
				if ($location_info) {
					if ($location_info['image']) {
						$image = $this->model_tool_image->resize($location_info['image'], $this->config->get($this->config->get('config_theme') . '_image_location_width'), $this->config->get($this->config->get('config_theme') . '_image_location_height'));
					}
					else {
						$image = false;
					}
					
					$locaton_maps = $this->gmap("location_map" . $location_id, $location_info['address'], $location_info['name']);
					
					$data['locations'][] = array(
					'location_id' => $location_info['location_id'],
					'name'        => $location_info['name'],
					'address'     => nl2br($location_info['address']),
					'google_map'  => $locaton_maps,
					'geocode'     => str_replace(" ", "", $location_info['geocode']),
					'telephone'   => $location_info['telephone'],
					'email'		=> $location_info['email'],
					'fax'         => $location_info['fax'],
					'image'       => $image,
					'open'        => nl2br($location_info['open']),
					'comment'     => $location_info['comment'],
					'store_email'     => $location_info['store_email']
					);
				}
			}
			
			// Captcha
			$data['captcha'] = '';
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('contact', (array)$this->config->get('config_captcha_page'))) {
				$data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'), $this->error);
			}
			
			$data = $this->load->controller('component/common', $data);

			foreach ($this->posts as $post_var => $post_default_value){
				$data[$post_var] = $post_default_value;
				$data['error_' . $post_var] = '';

				// Label Value
				$data['entry_' . $post_var] = $this->language->get('entry_' . $post_var);

				// Post Value
				if( isset($this->request->post[$post_var]) ) {
					$data[$post_var] = $this->request->post[$post_var];
				}

				// Error Value
				if( isset($this->error[$post_var]) ) {
					$data['error_' . $post_var] = $this->error[$post_var];
				}
			}
			//debug($this->error);
			$this->response->setOutput($this->load->view('information/contact', $data));
		}
		
		protected function validate() {
			if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 32)) {
				$this->error['name'] = $this->language->get('error_name');
			}

			if ((utf8_strlen($this->request->post['company_name']) < 3) || (utf8_strlen($this->request->post['company_name']) > 32)) {
				$this->error['company_name'] = $this->language->get('error_company_name');
			}

			// if ((utf8_strlen($this->request->post['subject']) < 3) || (utf8_strlen($this->request->post['subject']) > 32)) {
				// $this->error['subject'] = $this->language->get('error_subject');
			// }
			
			if ((int)$this->request->post['telephone'] < 1) {
				$this->error['telephone'] = $this->language->get('error_telephone');
			}
			
			if (!filter_var($this->request->post['email'], FILTER_VALIDATE_EMAIL)) {
				$this->error['email'] = $this->language->get('error_email');
			}
			
			if ((utf8_strlen($this->request->post['designation']) < 3) || (utf8_strlen($this->request->post['designation']) > 32)) {
				$this->error['designation'] = $this->language->get('error_designation');
			}
			
			if ((utf8_strlen($this->request->post['homepage_address']) < 8) || (utf8_strlen($this->request->post['homepage_address']) > 1000)) {
				$this->error['homepage_address'] = $this->language->get('error_homepage_address');
			}
			
			if ((utf8_strlen($this->request->post['enquiry']) < 10) || (utf8_strlen($this->request->post['enquiry']) > 3000)) {
				$this->error['enquiry'] = $this->language->get('error_enquiry');
			}
			
			if ((utf8_strlen($this->request->post['product_enquiry']) < 10) || (utf8_strlen($this->request->post['product_enquiry']) > 3000)) {
				$this->error['product_enquiry'] = $this->language->get('error_product_enquiry');
			}
			
			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('contact', (array)$this->config->get('config_captcha_page'))) {
				$captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');
				
				if ($captcha) {
					$this->error['captcha'] = $captcha;
				}
			}
			
			return !$this->error;
		}
		
		private function gmap($map = '', $address = '', $store = ''){ 
			$details = array();
			
			if($map && $address){
				
				$cached_map = $this->cache->get($map);
				
				if(!$cached_map){
				
					$find = array(
						"\n",
						"\r",
						"\r\n",
						"\n\r",
						" ",
					);
					
					$address = str_replace( $find, ' ', $address );
		
					$param = rawurlencode($address) . '&key=' . $this->config->get('config_google_api');
		
					$api_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" . $param; 
					
					$response = dynamic($api_url);
		
					if($response && isset($response['status']) && $response['status'] == 'OK'){
						$cached_map = array(
							'lat'	=> $response['results'][0]['geometry']['location']['lat'],
							'lng'	=> $response['results'][0]['geometry']['location']['lng'],
							'store'	=> $store?$store:$this->config->get('config_name'),
							'address'=> $address,
						);
						
						$this->cache->set($map, $cached_map);
					}
					else{
						$this->log->write( $map . " - Either the url is invalid or curl / fopen is not enabled" );
					}
				}
				
				$details = $cached_map;
			}
			
			return $details;
		}
		
		public function success() {

			$facebook_pixel_event_params_FAE = array(
				'event_name' => 'Lead');
			  // stores the pixel params in the session
			  $this->request->post['facebook_pixel_event_params_FAE'] =
				addslashes(json_encode($facebook_pixel_event_params_FAE));
				
			$this->load->language('information/contact');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$data['breadcrumbs'] = array();
			
			$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
			);
			
			$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('information/contact')
			);
			
			$data['heading_title'] = $this->language->get('heading_title');
			
			$data['text_message'] = $this->language->get('text_success');
			
			$data['button_continue'] = $this->language->get('button_continue');
			
			$data['continue'] = $this->url->link('common/home');
			
			$data = $this->load->controller('component/common', $data); 
			
			$this->response->setOutput($this->load->view('common/success', $data));
		}


		
		public function enquiry() {
			$this->load->language('information/contact');
			$json = array();
			$json['success'] = '0';
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate_enquiry()) {
				$mail 				 = new Mail();
				$mail->protocol 	 = $this->config->get('config_mail_protocol');
				$mail->parameter 	 = $this->config->get('config_mail_parameter');
				$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
				$mail->smtp_username = $this->config->get('config_mail_smtp_username');
				$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
				$mail->smtp_port 	 = $this->config->get('config_mail_smtp_port');
				$mail->smtp_timeout  = $this->config->get('config_mail_smtp_timeout');
				
				$mail->setTo($this->config->get('config_email'));
				//$mail->setFrom($this->request->post['email']);
				$mail->setFrom($this->config->get('config_email'));
	
				$mail->setSender(html_entity_decode($this->request->post['q_name'], ENT_QUOTES, 'UTF-8'));
				$mail->setSubject(html_entity_decode(sprintf($this->language->get('Enquiry'), $this->request->post['q_product_enquiry']), ENT_QUOTES, 'UTF-8'));
				
			
	
				$input_fields = array(
					'q_company_name',
					'q_name',
					'q_email',
					'q_contact',
					// 'q_subject',
					'q_homepage_address',
					'q_product_enquiry',
					'q_message'	// This will always be the last and large box
				);
	
				$disallow_field = array(
					'var_abc_name'
				);
				
				$message = "";
				
				foreach ($input_fields as $input_value){
	
					if( !in_array($input_value, $disallow_field) ){
						//can have checking for post if isset
						$message .= $this->language->get('entry_' .$input_value) . ":\n";
						$message .= $this->request->post[$input_value];
						$message .= "\n\n";
					}
				}
				
				$mail->setText($message);
				// $mail->send();
	
				// Pro email Template Mod
				/*if($this->config->get('pro_email_template_status')){
	
					$this->load->model('tool/pro_email');
	
					$email_params = array(
						'type' => 'admin.information.contact',
						'mail' => $mail,
						'reply_to' => $this->request->post['email'],
						'data' => array(
							//'enquiry_subject' => html_entity_decode($this->request->post['subject'], ENT_QUOTES, 'UTF-8'),
							'enquiry_telephone' => html_entity_decode($this->request->post['telephone'], ENT_QUOTES, 'UTF-8'),
							'enquiry_name' => html_entity_decode($this->request->post['name'], ENT_QUOTES, 'UTF-8'),
							'enquiry_mail' => html_entity_decode($this->request->post['email'], ENT_QUOTES, 'UTF-8'),
							'enquiry_message' => html_entity_decode($this->request->post['enquiry'], ENT_QUOTES, 'UTF-8'),
							// 'enquiry_message' => html_entity_decode($message, ENT_QUOTES, 'UTF-8'),
						),
					);
					
					$this->model_tool_pro_email->generate($email_params);
				}
				else{*/
					$mail->send();
				//}
				$json['success'] 	   = '1';
				$json['success_title'] = $this->language->get('q_success_title');
				$json['success_msg']   = $this->language->get('q_success_msg');
			}else{
				$json['error'] =  $this->error;
			}
			$this->response->setOutput(json_encode($json));	
		}

		protected function validate_enquiry() {
	
			if ((utf8_strlen($this->request->post['q_company_name']) < 3) || (utf8_strlen($this->request->post['q_company_name']) > 32)) {
				$this->error['q_company_name'] = $this->language->get('error_company_name');
			}

			if ((utf8_strlen($this->request->post['q_name']) < 3) || (utf8_strlen($this->request->post['q_name']) > 32)) {
				$this->error['q_name'] = $this->language->get('error_name');
			}

			if ((utf8_strlen($this->request->post['q_designation']) < 3) || (utf8_strlen($this->request->post['q_designation']) > 32)) {
				$this->error['q_designation'] = $this->language->get('error_designation');
			}
	
			// if ((utf8_strlen($this->request->post['q_subject']) < 3) || (utf8_strlen($this->request->post['q_subject']) > 32)) {
				// $this->error['q_subject'] = $this->language->get('error_subject');
			// }

			if ((int)$this->request->post['q_contact'] < 1) {
				$this->error['q_contact'] = $this->language->get('error_contact');
			}
			
			if (!filter_var($this->request->post['q_email'], FILTER_VALIDATE_EMAIL)) {
				$this->error['q_email'] = $this->language->get('error_email');
			}
			
			if (!filter_var($this->request->post['q_homepage_address'], FILTER_VALIDATE_EMAIL)) {
				$this->error['q_homepage_address'] = $this->language->get('error_homepage_address');
			}
			
			if ((utf8_strlen($this->request->post['product_enquiry']) < 10) || (utf8_strlen($this->request->post['product_enquiry']) > 3000)) {
				$this->error['product_enquiry'] = $this->language->get('error_product_enquiry');
			} 
			
			if ((utf8_strlen($this->request->post['q_message']) < 10) || (utf8_strlen($this->request->post['q_message']) > 3000)) {
				$this->error['q_message'] = $this->language->get('error_message');
			} 
			
			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('contact', (array)$this->config->get('config_captcha_page'))) {
				
			}
			
	
	
			return !$this->error;
		}
	}
