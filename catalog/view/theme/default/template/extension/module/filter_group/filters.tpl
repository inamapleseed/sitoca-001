<div id="side_filter" class="panel panel-default">

  <?php
    $total = 0;
      foreach ($filter_groups as $group) {
        if(count($group['filter']) != 0){
          $total = count($group['filter']);
          break;
          }
        }
        if($total != 0){
          foreach ($filter_groups as $filter_group) { ?>
    <div class="list-group">
      <div class="list-group-item item-header"><?php echo $filter_group['name']; ?></div>
      <div class="list-group-item">
        <div id="filter-group<?php echo $filter_group['filter_group_id']; ?>">
          <?php foreach ($filter_group['filter'] as $filter) { ?>
            <div class="checkbox">
                <label onmouseup="catchFilter();" >
                  <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
                    <label class="chk-container"><?php echo $filter['name']; ?>
                      <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" checked="checked" />
                    <span class="checkmark"></span>
                    </label>
                  <?php } else { ?>
                    <label class="chk-container"><?php echo $filter['name']; ?>
                      <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>"/>
                      <span class="checkmark"></span>
                    </label>
                  <?php } ?>
                </label>
            </div>
          <?php } ?>
        </div>
      </div>
    </div>
  <?php }} ?>


</div>