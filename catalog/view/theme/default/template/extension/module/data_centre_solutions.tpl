<div id="bg" class="data_centre_solutions" style="background-image: url(image/<?= $bg_image; ?>); background-repeat: no-repeat;">
	<div class="container parent_category_subcat_cont">
		<div class="row">
			<?php foreach ($categories as $category): ?>
				<div id="category_sub_cont" class="col-sm-12 col-md-4 col-lg-4">
					<div>
						<div class="category-relative">
							<?php if ($category['image'] ): ?>
								<img alt="Product Category" id="category_sub_cont_img" src="image/<?= $category['image']; ?>" alt="<?= $category['name']; ?>">
							<?php endif ?>
							<a href="<?= $category['href']; ?>">View</a>	
						</div>
					</div>
					<p id="category_sub_cont_p">
						<?= $category['name']; ?>
					</p>
				</div>
			<?php endforeach ?>
		</div>
	</div>
</div>