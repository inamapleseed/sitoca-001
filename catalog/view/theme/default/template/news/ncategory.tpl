<?php if ($is_category) { ?>
 <?php if ($thumb || $description) { ?>
  <div class="category-info">
    <?php if ($thumb) { ?>
    <div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
    <?php } ?>
    <?php if ($description) { ?> 
    <?php echo $description; ?>
    <?php } ?> 
  </div> 
  <?php } ?>
  <?php if ($ncategories) { ?>
  <h2><?php echo $text_refine; ?></h2>
  <div class="category-list" style="border-bottom: 2px solid #eee;">
    <?php if (count($ncategories) <= 5) { ?>
    <ul>
      <?php foreach ($ncategories as $ncategory) { ?>
      <li><a href="<?php echo $ncategory['href']; ?>"><?php echo $ncategory['name']; ?></a></li>
      <?php } ?>
    </ul>
    <?php } else { ?>
    <?php for ($i = 0; $i < count($ncategories);) { ?>
    <ul>
      <?php $j = $i + ceil(count($ncategories) / 4); ?>
      <?php for (; $i < $j; $i++) { ?>
      <?php if (isset($ncategories[$i])) { ?>
      <li><a href="<?php echo $ncategories[$i]['href']; ?>"><?php echo $ncategories[$i]['name']; ?></a></li>
      <?php } ?>
      <?php } ?>
    </ul>
    <?php } ?>
    <?php } ?>
  </div>
  <?php } ?>
<?php } ?>

<?php if ($article) { ?>
<div id="ncat_cont">
  <ul class="gallery-categ-title">
    <?php foreach ($tabs as $tab): ?>
      <li><a href="<?= $tab['href']; ?>"><?= $tab['name']; ?></a></li>
    <?php endforeach ?>
  </ul>
  
	<div class="bnews-list<?php if ($display_style) { ?> bnews-list-2<?php } ?>">
		<?php foreach ($article as $articles) { 
			?>

			<div class="gallery-thumb" href="<?= $articles['thumb']; ?>">
				<span class="pop-link">
					<div class="image">
						<img src="<?= $articles['thumb']; ?>" alt="<?= $articles['name']; ?>">
						<i class="fa fa-search" aria-hidden="true"></i>
					</div>
				</span>
			</div>
		<?php } ?>
  </div>
		<div class="row">
          <div class="col-sm-12 text-center"><?php echo $pagination; ?></div>
		</div>
</div>

	<script type="text/javascript">
	$(document).ready(function() {
		$('.pop-link').magnificPopup({
			type:'image',
			gallery: {
			          enabled: true
			        }
		});
		
		$('.bnews-list').magnificPopup({
  delegate: '.gallery-thumb', // child items selector, by clicking on it popup will open
  type: 'image'
  // other options
});
		$('img.article-image').each(function(index, element) {
		var articleWidth = $(this).parent().parent().width() * 0.7;
		var imageWidth = $(this).width() + 10;
		if (imageWidth >= articleWidth) {
			$(this).attr("align","center");
			$(this).parent().addClass('bigimagein');
		}
		});
		$(window).resize(function() {
		$('img.article-image').each(function(index, element) {
		var articleWidth = $(this).parent().parent().width() * 0.7;
		var imageWidth = $(this).width() + 10;
		if (imageWidth >= articleWidth) {
			$(this).attr("align","center");
			$(this).parent().addClass('bigimagein');
		}
		});
		});
	});
	//--></script>

<?php } ?>
<?php if ($is_category) { ?>
  <?php if (!$ncategories && !$article) { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <?php } ?>
<?php } else { ?>
  <?php if (!$article) { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <?php } ?>
<?php } ?>
<?php if ($disqus_status) { ?>
<script type="text/javascript">
var disqus_shortname = '<?php echo $disqus_sname; ?>';
(function () {
var s = document.createElement('script'); s.async = true;
s.type = 'text/javascript';
s.src = 'http://' + disqus_shortname + '.disqus.com/count.js';
(document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);
}());
</script>
<?php } ?>
<?php if ($fbcom_status) { ?>
<script type="text/javascript">
      window.fbAsyncInit = function() {
        FB.init({
          appId      : '<?php echo $fbcom_appid; ?>',
		  status     : true,
          xfbml      : true,
		  version    : 'v2.0'
        });
      };

      (function(d, s, id){
         var js, fjs = d.getElementsByTagName(s)[0];
         if (d.getElementById(id)) {return;}
         js = d.createElement(s); js.id = id;
         js.src = "//connect.facebook.net/en_US/sdk.js";
         fjs.parentNode.insertBefore(js, fjs);
       }(document, 'script', 'facebook-jssdk'));
</script>
<?php } ?>