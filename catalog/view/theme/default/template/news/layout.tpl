<?php echo $header; ?>
<div id="bg" style="background-image: url(image/catalog/slicing/computer_furniture/Rectangle-78copy3.png); background-repeat: no-repeat;">

<div class="container">
  <?php echo $content_top; ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">

      <h2><?php echo $heading_title; ?></h2>
      <?php echo $description; ?></div>
    <?php echo $column_right; ?></div>
    <?php echo $content_bottom; ?>
</div>
</div>
<?php echo $footer; ?> 