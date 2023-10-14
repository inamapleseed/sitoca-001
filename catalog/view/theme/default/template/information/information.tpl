<?php echo $header; ?>
  <div>
    <div class="hide breadings">
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
      <?php if ($content_bottom): ?>
          <?php echo $content_bottom; ?>
      <?php else: ?>
        <div class="container this">
              <?php echo $description; ?>
        </div>
      <?php endif ?>
  </div>

<?php echo $footer; ?>

<style type="text/css">
  .this {
    padding: 3%;
  }
</style>