<?= $header; ?>
<div id="bg" style="background-image: url(image/catalog/slicing/01.home/Rectangle-78.png); background-repeat: no-repeat;">
<div class="container contact-cont">
	<?= $content_top; ?>
	<div class="row one">
		<div id="content" class="">
			<div class="panel-default">
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-12">
						<?php if ($geocode || $google_map) { ?>
							<div data-id="gmap_contact" data-toggle="gmap" class="gmap"
								<?php if($google_map){ ?>
									data-lat="<?= $google_map['lat']; ?>" 
									data-lng="<?= $google_map['lng']; ?>" 
									data-store="<?= $google_map['store']; ?>" 
									data-address="<?= $google_map['address']; ?>" 
								<?php } ?>
								data-geo="<?= $geocode; ?>"
							>
								<div id="gmap_contact"></div>
							</div>
						<?php } ?>
						</div>

						<div class="container contact-info">
							<div class="col-sm-12 contact-info-left">
								<h4 class="h4contactpage">Contact Information</h4>
								<div class="store-address">
									<i class="fa fa-map-marker" aria-hidden="true"></i>
									<address>
										<p>
											<?= $address; ?>
										</p>
									</address>
								</div>
								<div class="phone">
									<i class="fa fa-phone" aria-hidden="true"></i>
									<a href="tel:+<?= $store_telephone; ?>">
										<?= $store_telephone; ?>
									</a>
								</div>
								<div class="email">
									<i class="fa fa-envelope" aria-hidden="true"></i>
									<a href="mailto:<?= $store_email; ?>">
										<?= $store_email; ?>
									</a>
								</div>
							</div>
							<div class="col-sm-12" id="gmap">
								<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d127638.19658085215!2d103.84119994130842!3d1.3604582429736238!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31da1791b391ff0b%3A0x3b12afed92ad1a85!2sSitoca!5e0!3m2!1sen!2sph!4v1569692953548!5m2!1sen!2sph" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
							</div>
						</div>
					</div>
				</div>
			</div>

			<?php if ($locations) { ?>
				<h3><?= $text_store; ?></h3>
				<div class="panel-group" id="accordion">
					<?php foreach ($locations as $index => $location) { ?>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a href="#collapse-location<?= $location['location_id']; ?>" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" >
										<?= $location['name']; ?> <i class="fa fa-caret-down"></i>
									</a>
								</h4>
							</div>
							<div class="panel-collapse collapse" id="collapse-location<?= $location['location_id']; ?>" >
								<div class="panel-body">
									<div class="row">
										    <?php if ($location['geocode'] || $location['google_map']) { ?> 
												<div class="col-sm-12">
													<div data-id="gmap<?= $index; ?>" data-toggle="gmap" class="gmap"
														<?php if($location['google_map']){ ?>
															data-lat="<?= $location['google_map']['lat']; ?>" 
															data-lng="<?= $location['google_map']['lng']; ?>" 
															data-store="<?= $location['google_map']['store']; ?>" 
															data-address="<?= $location['google_map']['address']; ?>" 
														<?php } ?>
													>
													<div id="gmap<?= $index; ?>" ></div>
													</div>
												</div>
											<?php } ?>
										
										<?php if ($location['image']) { ?>
											<div class="col-sm-3"><img src="<?= $location['image']; ?>" alt="<?= $location['name']; ?>" title="<?= $location['name']; ?>" class="img-thumbnail" /></div>
										<?php } ?>
										<div class="col-sm-3"><strong><?= $location['name']; ?></strong><br />
											<address>
												<?= $location['address']; ?>
											</address>
											<?php if ($location['geocode']) { ?>
												<a href="https://maps.google.com/maps?q=<?= urlencode($location['geocode']); ?>&hl=<?= $geocode_hl; ?>&t=m&z=15" target="_blank" class="btn btn-info"><i class="fa fa-map-marker"></i> <?= $button_map; ?></a>
											<?php } ?>
										</div>
										<div class="col-sm-3"> <strong><?= $text_telephone; ?></strong><br>
											<?= $location['telephone']; ?><br />
											<br />
											<?php if ($location['fax']) { ?>
												<strong><?= $text_fax; ?></strong><br>
												<?= $location['fax']; ?>
											<?php } ?>
										</div>
<!-- 										<div class="col-sm-3">
											<?php if ($location['open']) { ?>
												<strong><?= $text_open; ?></strong><br />
												<?= $location['open']; ?><br />
												<br />
											<?php } ?>
											<?php if ($location['comment']) { ?>
												<strong><?= $text_comment; ?></strong><br />
												<?= $location['comment']; ?>
											<?php } ?>
										</div> -->
									</div>
								</div>
							</div>
						</div>
					<?php } ?>
				</div>
				
			<?php } ?>
		<section class="enquiry-form-cont">
			<h3>Enquiry Form</h3>
			<p>For enquiries please reach out to us directly using the form below 
			</p>
			<form action="<?= $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
				<h4>Company/Personal Information:</h4>
				<div class="contact-body">
					<div class="form-group required fullw">
						<input type="text" name="company_name" value="<?= $company_name; ?>" id="input-company_name" class="form-control" placeholder="Company Name" />
						<?php if ($error_company_name) { ?>
							<div class="text-danger">Please input company name</div>
						<?php } ?>
					</div>

					<div class="form-group required">
						<input type="tel" name="telephone" value="<?= $telephone; ?>" id="input-telephone" class="form-control input-number" placeholder="Telephone" />
						<?php if ($error_telephone) { ?>
							<div class="text-danger"><?= $error_telephone; ?></div>
						<?php } ?>
					</div>

					<div class="form-group required">
						<input type="text" name="name" value="<?= $name; ?>" id="input-name" class="form-control" placeholder="Contact Person" />
						<?php if ($error_name) { ?>
							<div class="text-danger">Name must be between 3 and 32 characters</div>
						<?php } ?>								
					</div>
				
					<div class="form-group required">
						<input type="text" name="designation" value="<?= $designation; ?>" id="input-designation" class="form-control" placeholder="Designation" />
						<?php if ($error_designation) { ?>
							<div class="text-danger">Please input your designation</div>
						<?php } ?>
					</div>

					<div class="form-group required">
						<input type="text" name="email" value="<?= $email; ?>" id="input-email" class="form-control" placeholder="Email Address" />
						<?php if ($error_email) { ?>
							<div class="text-danger">Invalid email address</div>
						<?php } ?>
					</div>
				
					<div class="form-group required fullw">
						<input type="text" name="homepage_address" value="<?= $homepage_address; ?>" id="input-homepage_address" class="form-control" placeholder="Homepage Address" />
						<?php if ($error_homepage_address) { ?>
							<div class="text-danger">Please input your homepage address</div>
						<?php } ?>
					</div>

					<div class="form-group required fullw">
						<label class="">Which of our product(s) are you interested in?</label>
						<textarea name="product_enquiry" rows="10" id="input-product_enquiry" class="form-control" placeholder=""><?= $product_enquiry; ?></textarea>
						<?php if ($error_product_enquiry) { ?>
							<div class="text-danger">Product enquiry must be between 10 and 3000 characters</div>
						<?php } ?>
					</div>
					<div class="form-group required">
						<label>Enquiries/Comments:</label>
						<textarea name="enquiry" rows="10" id="input-enquiry" class="form-control" placeholder="<?= $entry_enquiry; ?>"><?= $enquiry; ?></textarea>
						<?php if ($error_enquiry) { ?>
							<div class="text-danger">Enquiry must be between 10 and 3000 characters!</div>
						<?php } ?>
					</div>

				</div>
				<div class="contact-footer">
					<?= $captcha; ?>
					<input class="btn btn-primary pull-sm-right" type="submit" value="<?= $button_submit; ?>" />
				</div>
			</form>

		</div>
	<?= $column_right; ?></div>
	<?= $content_bottom; ?>
	</section>
</div>

</div>
<?= $footer; ?>
