
<div id="product">
    <?php if ($options) { ?>
    <hr>
    <h3><?= $text_option; ?></h3>
    <?php foreach ($options as $option) { ?>
    <?php if ($option['type'] == 'select') { ?>
    <div class="form-group<?= ($option['required'] ? ' required' : ''); ?>">
      <label class="control-label" for="input-option<?= $option['product_option_id']; ?>"><?= $option['name']; ?></label>
      <select name="option[<?= $option['product_option_id']; ?>]" id="input-option<?= $option['product_option_id']; ?>" class="form-control">
        <option value=""><?= $text_select; ?></option>
        <?php foreach ($option['product_option_value'] as $option_value) { ?>
        <option value="<?= $option_value['product_option_value_id']; ?>"><?= $option_value['name']; ?>
        <?php if ($option_value['price']) { ?>
        (<?= $option_value['price_prefix']; ?><?= $option_value['price']; ?>)
        <?php } ?>
        </option>
        <?php } ?>
      </select>
    </div>
    <?php } ?>
    <?php if ($option['type'] == 'radio') { ?>
    <div class="form-group<?= ($option['required'] ? ' required' : ''); ?>">
      <label class="control-label"><?= $option['name']; ?></label>
      <div id="input-option<?= $option['product_option_id']; ?>">
        <?php foreach ($option['product_option_value'] as $option_value) { ?>
        <div class="radio">
          <label>
            <input type="radio" name="option[<?= $option['product_option_id']; ?>]" value="<?= $option_value['product_option_value_id']; ?>" />
            <?php if ($option_value['image']) { ?>
            <img src="<?= $option_value['image']; ?>" alt="<?= $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
            <?php } ?>                    
            <?= $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?= $option_value['price_prefix']; ?><?= $option_value['price']; ?>)
            <?php } ?>
          </label>
        </div>
        <?php } ?>
      </div>
    </div>
    <?php } ?>
    <?php if ($option['type'] == 'checkbox') { ?>
    <div class="form-group<?= ($option['required'] ? ' required' : ''); ?>">
      <label class="control-label"><?= $option['name']; ?></label>
      <div id="input-option<?= $option['product_option_id']; ?>">
        <?php foreach ($option['product_option_value'] as $option_value) { ?>
        <div class="checkbox">
          <label>
            <input type="checkbox" name="option[<?= $option['product_option_id']; ?>][]" value="<?= $option_value['product_option_value_id']; ?>" />
            <?php if ($option_value['image']) { ?>
            <img src="<?= $option_value['image']; ?>" alt="<?= $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
            <?php } ?>
            <?= $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?= $option_value['price_prefix']; ?><?= $option_value['price']; ?>)
            <?php } ?>
          </label>
        </div>
        <?php } ?>
      </div>
    </div>
    <?php } ?>
    <?php if ($option['type'] == 'text') { ?>
    <div class="form-group<?= ($option['required'] ? ' required' : ''); ?>">
      <label class="control-label" for="input-option<?= $option['product_option_id']; ?>"><?= $option['name']; ?></label>
      <input type="text" name="option[<?= $option['product_option_id']; ?>]" value="<?= $option['value']; ?>" placeholder="<?= $option['name']; ?>" id="input-option<?= $option['product_option_id']; ?>" class="form-control" />
    </div>
    <?php } ?>
    <?php if ($option['type'] == 'textarea') { ?>
    <div class="form-group<?= ($option['required'] ? ' required' : ''); ?>">
      <label class="control-label" for="input-option<?= $option['product_option_id']; ?>"><?= $option['name']; ?></label>
      <textarea name="option[<?= $option['product_option_id']; ?>]" rows="5" placeholder="<?= $option['name']; ?>" id="input-option<?= $option['product_option_id']; ?>" class="form-control"><?= $option['value']; ?></textarea>
    </div>
    <?php } ?>
    <?php if ($option['type'] == 'file') { ?>
    <div class="form-group<?= ($option['required'] ? ' required' : ''); ?>">
      <label class="control-label"><?= $option['name']; ?></label>
      <button type="button" id="button-upload<?= $option['product_option_id']; ?>" data-loading-text="<?= $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?= $button_upload; ?></button>
      <input type="hidden" name="option[<?= $option['product_option_id']; ?>]" value="" id="input-option<?= $option['product_option_id']; ?>" />
    </div>
    <?php } ?>
    <?php if ($option['type'] == 'date') { ?>
    <div class="form-group<?= ($option['required'] ? ' required' : ''); ?>">
      <label class="control-label" for="input-option<?= $option['product_option_id']; ?>"><?= $option['name']; ?></label>
      <div class="input-group date">
        <input type="text" name="option[<?= $option['product_option_id']; ?>]" value="<?= $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?= $option['product_option_id']; ?>" class="form-control" />
        <span class="input-group-btn">
        <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
        </span></div>
    </div>
    <?php } ?>
    <?php if ($option['type'] == 'datetime') { ?>
    <div class="form-group<?= ($option['required'] ? ' required' : ''); ?>">
      <label class="control-label" for="input-option<?= $option['product_option_id']; ?>"><?= $option['name']; ?></label>
      <div class="input-group datetime">
        <input type="text" name="option[<?= $option['product_option_id']; ?>]" value="<?= $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?= $option['product_option_id']; ?>" class="form-control" />
        <span class="input-group-btn">
        <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
        </span></div>
    </div>
    <?php } ?>
    <?php if ($option['type'] == 'time') { ?>
    <div class="form-group<?= ($option['required'] ? ' required' : ''); ?>">
      <label class="control-label" for="input-option<?= $option['product_option_id']; ?>"><?= $option['name']; ?></label>
      <div class="input-group time">
        <input type="text" name="option[<?= $option['product_option_id']; ?>]" value="<?= $option['value']; ?>" data-date-format="HH:mm" id="input-option<?= $option['product_option_id']; ?>" class="form-control" />
        <span class="input-group-btn">
        <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
        </span></div>
    </div>
    <?php } ?>
    <?php } ?>
    <?php } ?>
    <?php if ($recurrings) { ?>
    <hr>
    <h3><?= $text_payment_recurring; ?></h3>
    <div class="form-group required">
      <select name="recurring_id" class="form-control">
        <option value=""><?= $text_select; ?></option>
        <?php foreach ($recurrings as $recurring) { ?>
        <option value="<?= $recurring['recurring_id']; ?>"><?= $recurring['name']; ?></option>
        <?php } ?>
      </select>
      <div class="help-block" id="recurring-description"></div>
    </div>
    <?php } ?>
    <div class="form-group">
      
        <div class="input-group">
          <span class="input-group-addon"><p id="input-group-addon">Quantity</p></span>
          <span class="input-group-btn"> 
            <button type="button" class="btn btn-default btn-number" data-type="minus" data-field="qty-<?= $product_id; ?>" onclick="descrement($(this).parent().parent())")>
              <span class="glyphicon glyphicon-minus"></span> 
            </button>
          </span>
          <input type="text" name="quantity" class="form-control input-number integer text-center" id="input-quantity" value="<?= $minimum; ?>" >
          <span class="input-group-btn">
            <button type="button" class="btn btn-default btn-number" data-type="plus" data-field="qty-<?= $product_id; ?>" onclick="increment($(this).parent().parent())">
              <span class="glyphicon glyphicon-plus"></span>
            </button>
          </span>
        </div>
  
      <input type="hidden" name="product_id" value="<?= $product_id; ?>" />
      <br />
  
      <?php if(!$enquiry){ ?>
        <button type="button" id="button-cart" data-loading-text="<?= $text_loading; ?>" class="btn btn-primary"><?= $button_cart; ?></button>
      <?php }else{ ?>
        <button type="button" id="button-enquiry" data-loading-text="<?= $text_loading; ?>" class="btn btn-primary"><?= $button_enquiry; ?></button>
      <?php } ?>
      
      <?php if($download){ ?>
        <a href="<?= $download; ?>" target="_blank" class="btn btn-primary" ><?= $button_download; ?></a>
      <?php } ?>
  
    </div>
    <?php if ($minimum > 1) { ?>
    <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?= $text_minimum; ?></div>
    <?php } ?>
  </div>


  
<script type="text/javascript"><!--
    $('.date').datetimepicker({
        pickTime: false
    });
    
    $('.datetime').datetimepicker({
        pickDate: true,
        pickTime: true
    });
    
    $('.time').datetimepicker({
        pickDate: false
    });
    
    $('button[id^=\'button-upload\']').on('click', function() {
        var node = this;
    
        $('#form-upload').remove();
    
        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');
    
        $('#form-upload input[name=\'file\']').trigger('click');
    
        if (typeof timer != 'undefined') {
            clearInterval(timer);
        }
    
        timer = setInterval(function() {
            if ($('#form-upload input[name=\'file\']').val() != '') {
                clearInterval(timer);
    
                $.ajax({
                    url: 'index.php?route=tool/upload',
                    type: 'post',
                    dataType: 'json',
                    data: new FormData($('#form-upload')[0]),
                    cache: false,
                    contentType: false,
                    processData: false,
                    beforeSend: function() {
                        $(node).button('loading');
                    },
                    complete: function() {
                        $(node).button('reset');
                    },
                    success: function(json) {
                        $('.text-danger').remove();
    
                        if (json['error']) {
                            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                        }
    
                        if (json['success']) {
                            alert(json['success']);
    
                            $(node).parent().find('input').val(json['code']);
                        }
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        }, 500);
    });
    //--></script>

  <?php if(isset($update_price_status) && $update_price_status) { ?>
					
	<script type="text/javascript">
	
		$("#product input[type='checkbox']").click(function() {
			changePrice();
		});
		
		$("#product input[type='radio']").click(function() {
			changePrice();
		});
		
		$("#product select").change(function() {
			changePrice();
		});
		
		$("#input-quantity").blur(function() {
			changePrice();
		});

    $("#input-quantity").parent(".input-group").find(".btn-number").click(function() {
			changePrice();
		});
		
		function changePrice() {
			$.ajax({
				url: 'index.php?route=product/product/updatePrice&product_id=<?php echo $product_id; ?>',
				type: 'post',
				dataType: 'json',
				data: $('#product input[name=\'quantity\'], #product select, #product input[type=\'checkbox\']:checked, #product input[type=\'radio\']:checked'),
				beforeSend: function() {
					
				},
				complete: function() {
					
				},
				success: function(json) {
					$('.alert-success, .alert-danger').remove();
					
					if(json['new_price_found']) {
						$('.new-prices').html(json['total_price']);
						$('.product-tax').html(json['tax_price']);
					} else {
						$('.old-prices').html(json['total_price']);
						$('.product-tax').html(json['tax_price']);
					}
				}
			});
		}
	</script>
		
<?php } ?>