<?php if($manufacturers){ ?>

<div id="side-manufacturer">
	<div class="list-group-item item-header" id="brands-header"><?= $heading_title; ?></div>
	<div class="list-group-item">
		<?php foreach($manufacturers as $manufacturer){ ?>
		<label>
			<?php if($manufacturer['checked']){ ?>
				<label class="chk-container"><?= $manufacturer['name']; ?>
				<input type="checkbox" name="manufacturer_ids[]" value="<?= $manufacturer['mid']; ?>" checked />
				<span class="checkmark"></span>
				</label>
			<?php }else{ ?>
			<label class="chk-container"><?= $manufacturer['name']; ?>
				<input type="checkbox" name="manufacturer_ids[]" value="<?= $manufacturer['mid']; ?>"/>
				<span class="checkmark"></span>
				</label>
			<?php } ?>
			
		</label>
		<?php } ?>
	</div>
</div>

<?php } ?>