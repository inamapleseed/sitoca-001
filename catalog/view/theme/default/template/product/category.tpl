<?php echo $header; ?>
<div id="bg" style="background-image: url(image/catalog/slicing/01.home/Rectangle-78.png); background-repeat: no-repeat;">
<div class="container">
  <?php echo $content_top; ?>
  <div class="row inner_cat_cont">
  
    <?php echo $column_left; ?>

    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>

    <div id="content" class="<?php echo $class; ?>">

      <div id="product-filter-replace">
        <div id="product-filter-loading-overlay"></div>
        
          <?php if ($products) { ?>
          
            <?php include_once('sort_order.tpl'); ?>
              
            <div id="product-filter-detect">
              
              <div class="row">
                <div class="product-view">
                  <?php foreach ($products as $product) { ?>
                    <?php echo $product; ?>
                  <?php } ?>
                </div>
              </div>

              <div class="row">
                <div class="col-sm-12 text-center"><?php echo $pagination; ?></div>
              </div>

            </div> <!-- #product-filter-detect -->

          <?php } ?>

          <?php if (!$products) { ?>
          
            <p><?php echo $text_empty; ?></p>
            <div class="buttons hidden">
              <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
            </div>

          <?php } ?>

      </div> <!-- #product-filter-replace -->
    </div> <!-- #content -->

    <?php echo $column_right; ?></div>
    <?php echo $content_bottom; ?>
</div>
</div>

<?php echo $footer; ?>
