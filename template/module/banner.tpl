<div id="banner{$module}" class="owl-carousel">
  {foreach from=$banners item=banner}
  <div class="item">
    {if $banner.link}
    <a href="{$banner.link}"><img src="{$banner.image}" alt="{$banner.title}" class="img-responsive" /></a>
    {else}
    <img src="{$banner.image}" alt="{$banner.title}" class="img-responsive" />
    <?php } ?>
  </div>
  <?php } ?>
</div>
<script type="text/javascript"><!--
$('#banner{$module}').owlCarousel({
	items: 6,
	autoPlay: 3000,
	singleItem: true,
	navigation: false,
	pagination: false,
	transitionStyle: 'fade'
});
--></script>
