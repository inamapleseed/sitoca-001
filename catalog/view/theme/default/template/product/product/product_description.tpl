<h3 id="single_item_title"><?= $product_name; ?></h3>
  <?php if ($waiting_module) { ?>
    <p class="p_out_of_stock">out of stock</p>
  <?php } ?>
<?php if ($price && !$enquiry) { ?>
<ul class="list-unstyled">
  <?php if (!$special) { ?>
  <li>
    <div class="product-price old-prices" ><?= $price; ?></div>
  </li>
  <?php } else { ?>
  <p class="sale-tag">Sale</p>
  <div class="sale-price">
    <li><span style="text-decoration: line-through;" class="old-prices"><?= $price; ?></span></li>
    <li>
      <div class="product-special-price new-prices"><?= $special; ?></div>
    </li>
  </div>
  <?php } ?>

    
  <?php if ($tax) { ?>
  <li class="product-tax-price product-tax" ><?= $text_tax; ?> <?= $tax; ?></li>
  <?php } ?>
  <?php if ($points) { ?>
  <li><?= $text_points; ?> <?= $points; ?></li>
  <?php } ?>
  <?php if ($discounts) { ?>
  <li>
    <hr>
  </li>
  <?php foreach ($discounts as $discount) { ?>
  <li><?= $discount['quantity']; ?><?= $text_discount; ?><?= $discount['price']; ?></li>
  <?php } ?>
  <?php } ?>
</ul>
<?php } ?>

<?php if($enquiry){ ?>
<div class="enquiry-block">
  <div class="label label-primary">
    <?= $text_enquiry_item; ?>
  </div>
</div>
<?php } ?>
<div class="product-description">
      <?= $description; ?>
</div>

<?php if ($waiting_module): ?>
  <?= $waiting_module; ?>
<?php else: ?>
  <?php include_once('product_options.tpl'); ?>
<?php endif ?>
