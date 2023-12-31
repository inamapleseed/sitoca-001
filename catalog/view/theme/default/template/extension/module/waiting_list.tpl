<div id="waiting_list">
    <div>
        <?php if($description){ ?>
        <div class="waiting_list_description">
            <?= $description; ?> 
        </div>
        <?php } ?>
        <div class="flex-group">
            <input id="enquiry-input" name="email" placeholder="<?= $entry_email; ?>" value="<?= $email; ?>" />
            <button id="waiting_list_submit" type="button" class="btn btn-primary" ><?= $button_submit; ?></button>
        </div>
    </div>
    <input type="hidden" name="product_id" value="<?= $product_id; ?>"/>
    <script>
        $(window).load(function(){
            $('#waiting_list_submit').on('click', function(e){
                e.preventDefault();
                $.ajax({
                    url: 'index.php?route=extension/module/waiting_list/add',
                    data: $('#waiting_list input'),
                    dataType: 'json',
                    type: 'post',
                    beforeSend: function(){
                        $('#waiting_list_submit').prop('disabled', true);
                    },
                    success: function(json){
                        if(json['error_title']){
                            swal({
                                title: json['error_title'],
                                html: json['error_general'],
                                type: 'warning'
                            });
                        }else if(json['success_title']){
                            swal({
                                title: json['success_title'],
                                html: json['success_general'],
                                type: 'success'
                            });
                        }

                        $('#waiting_list_submit').prop('disabled', false);
                    }
                });
            });
        });
    </script>
</div>