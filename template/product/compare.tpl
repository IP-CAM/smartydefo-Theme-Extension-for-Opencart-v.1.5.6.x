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
      <h1>{$heading_title}</h1>
      {if $products}
      <table class="table table-bordered">
        <thead>
          <tr>
            <td colspan="{count($products) + 1}"><strong>{$text_product}</strong></td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>{$text_name}</td>
            {foreach from=$products item=product}
            <td><a href="{$products[$product.product_id]['href']}"><strong>{$products[$product.product_id]['name']}</strong></a></td>
            <?php } ?>
          </tr>
          <tr>
            <td>{$text_image}</td>
            {foreach from=$products item=product}
            <td class="text-center">{if $products[$product.product_id]['thumb']}
              <img src="{$products[$product.product_id]['thumb']}" alt="{$products[$product.product_id]['name']}" title="{$products[$product.product_id]['name']}" class="img-thumbnail" />
              <?php } ?></td>
            <?php } ?>
          </tr>
          <tr>
            <td>{$text_price}</td>
            {foreach from=$products item=product}
            <td>{if $products[$product.product_id]['price']}
              {if !$products[$product.product_id]['special']}
              {$products[$product.product_id]['price']}
              {else}
              <span class="price-old">{$products[$product.product_id]['price']} </span> <span class="price-new"> {$products[$product.product_id]['special']} </span>
              <?php } ?>
              <?php } ?></td>
            <?php } ?>
          </tr>
          <tr>
            <td>{$text_model}</td>
            {foreach from=$products item=product}
            <td>{$products[$product.product_id]['model']}</td>
            <?php } ?>
          </tr>
          <tr>
            <td>{$text_manufacturer}</td>
            {foreach from=$products item=product}
            <td>{$products[$product.product_id]['manufacturer']}</td>
            <?php } ?>
          </tr>
          <tr>
            <td>{$text_availability}</td>
            {foreach from=$products item=product}
            <td>{$products[$product.product_id]['availability']}</td>
            <?php } ?>
          </tr>
          {if $review_status}
          <tr>
            <td>{$text_rating}</td>
            {foreach from=$products item=product}
            <td class="rating"><?php for ($i = 1; $i <= 5; $i++) { ?>
              {if $products[$product.product_id]['rating'] < $i}
              <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
              {else}
              <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
              <?php } ?>
              <?php } ?>
              <br />
              {$products[$product.product_id]['reviews']}</td>
            <?php } ?>
          </tr>
          <?php } ?>
          <tr>
            <td>{$text_summary}</td>
            {foreach from=$products item=product}
            <td class="description">{$products[$product.product_id]['description']}</td>
            <?php } ?>
          </tr>
          <tr>
            <td>{$text_weight}</td>
            {foreach from=$products item=product}
            <td>{$products[$product.product_id]['weight']}</td>
            <?php } ?>
          </tr>
          <tr>
            <td>{$text_dimension}</td>
            {foreach from=$products item=product}
            <td>{$products[$product.product_id]['length']} x {$products[$product.product_id]['width']} x {$products[$product.product_id]['height']}</td>
            <?php } ?>
          </tr>
        </tbody>
        {foreach from=$attribute_groups item=attribute_group}
        <thead>
          <tr>
            <td colspan="{count($products) + 1}"><strong>{$attribute_group.name}</strong></td>
          </tr>
        </thead>
        {foreach from=$attribute_group.attribute item=key => $attribute}
        <tbody>
          <tr>
            <td>{$attribute.name}</td>
            {foreach from=$products item=product}
            {if isset($products[$product.product_id]['attribute'][$key])}
            <td>{$products[$product.product_id]['attribute'][$key]}</td>
            {else}
            <td></td>
            <?php } ?>
            <?php } ?>
          </tr>
        </tbody>
        <?php } ?>
        <?php } ?>
        <tr>
          <td></td>
          {foreach from=$products item=product}
          <td><input type="button" value="{$button_cart}" class="btn btn-primary btn-block" onclick="cart.add('{$product.product_id}');" />
            <a href="{$product.remove}" class="btn btn-danger btn-block">{$button_remove}</a></td>
          <?php } ?>
        </tr>
      </table>
      {else}
      <p>{$text_empty}</p>
      <div class="buttons">
        <div class="pull-right"><a href="{$continue}" class="btn btn-default">{$button_continue}</a></div>
      </div>
      <?php } ?>
      {$content_bottom}</div>
    {$column_right}</div>
</div>
{$footer}