<div id="bg" style="background-image: url(image/<?= $bg_image; ?>); background-repeat: no-repeat;">
	<div class="homepage-cont">		
		<?php foreach ($items as $item): ?>
			<div class="container category-desc">
				<div class="image-container">
					<img alt="Data Centre Solution / Computer Furniture" src="image/<?= $item['image'] ?>">
				</div>
				<div class="category-text-details">
					<h3 id="h3home">
						<?= $item['title']; ?>
					</h3>
					<p>
						<?= $item['text']; ?>
					</p>
					<a id="btn" class="btn" href="<?= $item['url']; ?>"><?= $item['button']; ?></a>
				</div>
			</div>
		<?php endforeach ?>
	</div>
</div>