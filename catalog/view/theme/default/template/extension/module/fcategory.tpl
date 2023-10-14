<div class="row" id="featured-categories-section">
  <?php foreach ($categories as $category) { 
  	?>
  	<div class="row">
  		<div id="featured-categories" class="col-12">
  			<div class="featured-image"><a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" class="img-responsive" /></a>
  			</div>
        <div class="text-details">
    			<h2><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></h2>
    			<div class="cat-desc">
    				<?php echo $category['description']; ?>
    			</div>
        </div>
  		</div>
  	</div>

  <?php } ?>
</div>
