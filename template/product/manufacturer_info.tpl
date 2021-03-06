{$header}
<div class="container">
  <ul class="breadcrumb">
    {foreach from=$breadcrumbs item=breadcrumb}
    <li><a href="{$breadcrumb.href}">{$breadcrumb.text}</a></li>
    <?php } ?>
  </ul>
  <div class="row">{$column_left}
    {if $column_left && $column_right}
    <?php $class = 'col-sm-6'; ?>
    {elseif $column_left || $column_right}
    <?php $class = 'col-sm-9'; ?>
    {else}
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="{$class}">{$content_top}
      <h2>{$heading_title}</h2>
      {if $products}
      <p><a href="{$compare}" id="compare-total"> {$text_compare}</a></p>
      <div class="row">
        <div class="col-sm-3">
          <div class="btn-group hidden-xs">
            <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="{$button_list}"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="{$button_grid}"><i class="fa fa-th"></i></button>
          </div>
        </div>
        <div class="col-sm-1 col-sm-offset-2 text-right">
          <label class="control-label" for="input-sort">{$text_sort}</label>
        </div>
        <div class="col-sm-3 text-right">
          <select id="input-sort" class="form-control col-sm-3" onchange="location = this.value;">
            {foreach from=$sorts item=sorts}
            {if $sorts.value == $sort . '-' . $order}
            <option value="{$sorts.href}" selected="selected">{$sorts.text}</option>
            {else}
            <option value="{$sorts.href}">{$sorts.text}</option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-sm-1 text-right">
          <label class="control-label" for="input-limit">{$text_limit}</label>
        </div>
        <div class="col-sm-2 text-right">
          <select id="input-limit" class="form-control" onchange="location = this.value;">
            {foreach from=$limits item=limits}
            {if $limits.value == $limit}
            <option value="{$limits.href}" selected="selected">{$limits.text}</option>
            {else}
            <option value="{$limits.href}">{$limits.text}</option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
      </div>
      <br />
      <div class="row">      
        {foreach from=$products item=product}
        <div class="product-layout product-list col-xs-12">
          <div class="product-thumb">
            <div class="image"><a href="{$product.href}"><img src="{$product.thumb}" alt="{$product.name}" title="{$product.name}" class="img-responsive" /></a></div>
            <div class="caption">
              <h4><a href="{$product.href}">{$product.name}</a></h4>
              <p>{$product.description}</p>
              {if $product.rating}
              <div class="rating">
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                {if $product.rating < $i}
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                {else}
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                <?php } ?>
                <?php } ?>
              </div>
              <?php } ?>
              {if $product.price}
              <p class="price">
                {if !$product.special}
                {$product.price}
                {else}
                <span class="price-new">{$product.special}</span> <span class="price-old">{$product.price}</span>
                <?php } ?>
                {if $product.tax}
                <span class="price-tax">{$text_tax} {$product.tax}</span>
                <?php } ?>
              </p>
              <?php } ?>
            </div>
            <div class="button-group">
              <button type="button" onclick="cart.add('{$product.product_id}');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md">{$button_cart}</span></button>
              <button type="button" data-toggle="tooltip" title="{$button_wishlist}" onclick="wishlist.add('{$product.product_id}');"><i class="fa fa-heart"></i></button>
              <button type="button" data-toggle="tooltip" title="{$button_compare}" onclick="compare.add('{$product.product_id}');"><i class="fa fa-exchange"></i></button>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left">{$pagination}</div>
        <div class="col-sm-6 text-right">{$results}</div>
      </div>
      {else}
      <p>{$text_empty}</p>
      <div class="buttons">
        <div class="pull-right"><a href="{$continue}" class="btn btn-primary">{$button_continue}</a></div>
      </div>
      <?php } ?>
      {$content_bottom}</div>
    {$column_right}</div>
</div>
{$footer} 