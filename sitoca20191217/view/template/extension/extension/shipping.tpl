<fieldset>
  <legend><?php echo $heading_title; ?></legend>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="table-responsive">
    <div class="input-group">
      <div class="input-group-addon">Search</div>
      <input type="text" class="form-control" onkeyup="filterExtension(this.value);" />
    </div>
    <script>
      function filterExtension(keyword) {
        if (keyword) {
          keyword = keyword.split(' ').join('-');
          keyword = keyword.toLowerCase();
          $("#shippings_body > tr:not([query*=\"" + keyword + "\"])").hide();
          $("#shippings_body > tr[query*=\"" + keyword + "\"]").removeAttr('style');
        }
        else {
          $("#shippings_body > tr").removeAttr('style');
        }

      }
    </script>
    <hr />
    <table class="table table-bordered table-hover">
      <thead>
        <tr>
          <td class="text-left"><?php echo $column_name; ?></td>
          <td class="text-left"><?php echo $column_status; ?></td>
          <td class="text-right"><?php echo $column_sort_order; ?></td>
          <td class="text-right"><?php echo $column_action; ?></td>
        </tr>
      </thead>
      <tbody id="shippings_body">
        <?php if ($extensions) { ?>
        <?php foreach ($extensions as $extension) { ?>
        <tr query="<?php echo generateSlug($extension['name']); ?>" >
          <td class="text-left"><?php echo $extension['name']; ?></td>
          <td class="text-left"><?php echo $extension['status']; ?></td>
          <td class="text-right"><?php echo $extension['sort_order']; ?></td>
          <td class="text-right"><?php if ($extension['installed']) { ?>
            <a href="<?php echo $extension['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a>
            <?php } else { ?>
            <button type="button" class="btn btn-primary" disabled="disabled"><i class="fa fa-pencil"></i></button>
            <?php } ?>
            <?php if (!$extension['installed']) { ?>
            <a href="<?php echo $extension['install']; ?>" data-toggle="tooltip" title="<?php echo $button_install; ?>" class="btn btn-success"><i class="fa fa-plus-circle"></i></a>
            <?php } else { ?>
            <a href="<?php echo $extension['uninstall']; ?>" data-toggle="tooltip" title="<?php echo $button_uninstall; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></a>
            <?php } ?></td>
        </tr>
        <?php } ?>
        <?php } else { ?>
        <tr>
          <td class="text-center" colspan="4"><?php echo $text_no_results; ?></td>
        </tr>
        <?php } ?>
      </tbody>
    </table>
  </div>
</fieldset>
