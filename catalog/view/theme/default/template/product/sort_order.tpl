<div class="row">

    <div class="col-md-6 col-xs-12 text-center">
    </div>

    <div class="col-md-3 col-xs-6">
        <div class="form-group input-group input-group-sm">
            <select id="input-sort" class="form-control no-custom" onchange="select_handler();">
            <?php foreach ($sorts as $sorts) { ?>
                <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                    <option value="<?php echo $sorts['value']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                <?php } else { ?>
                    <option value="<?php echo $sorts['value']; ?>"><?php echo $sorts['text']; ?></option>
                <?php } ?>
            <?php } ?>
            </select>
        </div>
    </div>

    <div class="col-md-3 col-xs-6">
        <div class="form-group input-group input-group-sm">
            <select id="input-limit" class="form-control no-custom" onchange="select_handler();">
            <?php foreach ($limits as $limits) { ?>
                <?php if ($limits['value'] == $limit) { ?>
                    <option value="<?php echo $limits['value']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                <?php } else { ?>
                    <option value="<?php echo $limits['value']; ?>"><?php echo $limits['text']; ?></option>
                <?php } ?>
            <?php } ?>
            </select>
        </div>
    </div>
</div>