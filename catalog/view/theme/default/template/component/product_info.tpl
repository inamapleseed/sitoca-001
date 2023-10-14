<div class="product-block <?= $out_of_stock; ?>">
	<div class="product-image-block relative">
		<?php if($sticker && $sticker['name']){ ?>
		<a 
		href="<?= $href; ?>" 
		title="<?= $name; ?>" 
		class="sticker absolute" 
		style="color: <?= $sticker['color']; ?>; background-color: <?= $sticker['background-color']; ?>">
			<span>
				<?= $sticker['name']; ?>
			</span>
		</a>
		<?php } ?>
		<div class="product-block-inner">
			<img 
				src="<?= $thumb; ?>" 
				alt="<?= $name; ?>" 
				title="<?= $name; ?>"
				class="img-responsive" />
		<a 
			href="<?= $href; ?>" 
			title="<?= $name; ?>" 
			class="product-image image-container relative" >View
		</a>
		</div>
	</div>
	<div class="product-name">
		<a href="<?= $href; ?>"><?= $name; ?></a>
	</div>

	<?php if($rating) { ?>
	<div class="rating">
		<?php for ($i = 1; $i <= 5; $i++) { ?>
		<?php if ($rating < $i) { ?>
		<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
		<?php } else { ?>
		<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
		<?php } ?>
		<?php } ?>
	</div>
	<?php } ?>

	<div class="product-details">
		<?php if ($price && !$enquiry) { ?>
			<div class="price">
				<?php if (!$special) { ?>
					<?= $price; ?>
				<?php } else { ?>
					<span class="price-old"><?= $price; ?></span>
					<span class="price-new"><?= $special; ?></span>
				<?php } ?>
				<?php if ($tax) { ?>
					<span class="price-tax"><?= $text_tax; ?> <?= $tax; ?></span>
				<?php } ?>
			</div>
		<?php } ?>

		<?php if($enquiry){ ?>
		<span class="label label-primary">
			<?= $label_enquiry; ?>
		</span>
		<?php } ?>
	</div>
</div>




