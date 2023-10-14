<footer>
	<div class="container">
		<div class="footer-upper-contet">
			<?php if ($menu) { ?>
				<?php foreach($menu as $links){ ?>
				<div class="footer-contact-links">
					<h5>
						<?php if($links['href'] != '#'){ ?>
						<?= $links['name']; ?>
						<?php }else{ ?>
						<a href="<?= $links['href']; ?>" 
							<?php if($links['new_tab']){ ?>
								target="_blank"
							<?php } ?>
							>
							<?= $links['name']; ?></a>
						<?php } ?>
					</h5>
					<?php if($links['child']){ ?>
					<ul class="list-unstyled">
						<?php foreach ($links['child'] as $each) { ?>
						<li><a href="<?= $each['href']; ?>"
							<?php if($each['new_tab']){ ?>
								target="_blank"
							<?php } ?>
							
							>
								<?= $each['name']; ?></a></li>
						<?php } ?>
					</ul>
					<?php } ?>
				</div>
				<?php } ?>
			<?php } ?>

			<?php if($mailchimp){ ?>
				<div class="newsletter-section text-center">
					<?= $mailchimp; ?>
				</div>
			<?php } ?>

			<div class="footer-logo">
				<img src="image/<?= $config_footer_logo ?>">
				<img src="image/footer_logo2.png">
			</div>
		</div>
		<div class="row footer-bottom-content">
			<div class="" >
				<p class="text-center">Copyright &copy; 2019. Sitoca. All rights reserved.</p>
			</div>
			<div class="" id="fcs">
				<img id="fcs_footer_logo" src="image/catalog/fcs.png">
				<p> <a href="https://www.firstcom.com.sg/">Web design by</a> <b>Firstcom Solutions</b></p>
			</div>
		</div>
	</div>
</footer>
<div id="ToTopHover" ></div>
<script>AOS.init({
	once: true
});</script>
<?php 
/* extension bganycombi - Buy Any Get Any Product Combination Pack */
echo $bganycombi_module; 
?>
</body></html>