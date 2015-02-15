{$header}
<div class="container">
  <ul class="breadcrumb">
    {foreach from=$breadcrumbs item=breadcrumb}
    <li><a href="{$breadcrumb.href}">{$breadcrumb.text}</a></li>
    <?php } ?>
  </ul>
  {if $success}
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> {$success}
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
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
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-center">{$column_image}</td>
            <td class="text-left">{$column_name}</td>
            <td class="text-left">{$column_model}</td>
            <td class="text-right">{$column_stock}</td>
            <td class="text-right">{$column_price}</td>
            <td class="text-right">{$column_action}</td>
          </tr>
        </thead>
        <tbody>
          {foreach from=$products item=product}
          <tr>
            <td class="text-center">{if $product.thumb}
              <a href="{$product.href}"><img src="{$product.thumb}" alt="{$product.name}" title="{$product.name}" /></a>
              <?php } ?></td>
            <td class="text-left"><a href="{$product.href}">{$product.name}</a></td>
            <td class="text-left">{$product.model}</td>
            <td class="text-right">{$product.stock}</td>
            <td class="text-right">{if $product.price}
              <div class="price">
                {if !$product.special}
                {$product.price}
                {else}
                <b>{$product.special}</b> <s>{$product.price}</s>
                <?php } ?>
              </div>
              <?php } ?></td>
            <td class="text-right"><button type="button" onclick="cart.add('{$product.product_id}');" data-toggle="tooltip" title="{$button_cart}" class="btn btn-primary"><i class="fa fa-shopping-cart"></i></button>
              <a href="{$product.remove}" data-toggle="tooltip" title="{$button_remove}" class="btn btn-danger"><i class="fa fa-times"></i></a></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
      {else}
      <p>{$text_empty}</p>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="{$continue}" class="btn btn-primary">{$button_continue}</a></div>
      </div>
      {$content_bottom}</div>
    {$column_right}</div>
</div>
{$footer} 