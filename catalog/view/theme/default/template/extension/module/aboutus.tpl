<div id="bg" style="background-image: url(image/<?= $bg_image; ?>); background-repeat: no-repeat; background-size: cover">
	<div class="container aboutus">
		<div class="row">
			<div>
				<h3 id="h3about">
					<?= $title; ?>
				</h3>
				<p id="pabout">
					<?= $text; ?>
				</p>
			</div>
		</div>
		<div id="about_lists_sect">
			<div id="ul" class="col-sm-12 col-md-6 col-lg-6 p-0">
				<ul>
				<?php foreach ($list as $item): ?>
					<li><?= $item['name'] ?></li>
				<?php endforeach ?>
				</ul>
			</div>
			<div class="col-sm-12 col-md-6 col-lg-6 p-0">
				<img alt="Sitoca Manufacture" id="about_sec_img" src="image/<?= $image; ?>">
			</div>
		</div>
	</div>
</div>
<section class="about_section_2">
	<div class="container">
		<div class="about_section_2_overview">
			<?php foreach ($s2_list as $s2): ?>
				<div class="about_section_2_overview_content">
					<h4 id="h4about">
						<?= $s2['s2_title'] ?>
					</h4>
					<hr>
					<div id="pabout2">
						<?= html_entity_decode($s2['s2_desc'], ENT_QUOTES, 'UTF-8') ?>
					</div>
				</div>
			<?php endforeach ?>
			<div class="about_logos  hidden" id="abtlogos">
				<?php foreach ($s2_img_list as $img_list): ?>
					<img alt="Certification Logo" class="about_logos_img" src="image/<?= $img_list['s2_img']; ?>">
				<?php endforeach ?>
			</div>
		</div>
	</div>
</section>