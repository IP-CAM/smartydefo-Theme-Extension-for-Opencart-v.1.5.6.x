<div id="cart" class="btn-group btn-block">
  <button type="button" data-toggle="dropdown" data-loading-text="{$text_loading}" class="btn btn-inverse btn-block btn-lg dropdown-toggle"><i class="fa fa-shopping-cart"></i> <span id="cart-total">{$text_items}</span></button>
  <ul class="dropdown-menu pull-right">
    {if $products || $vouchers}
    <li>
      <table class="table table-striped">
        {foreach from=$products item=product}
        <tr>
          <td class="text-center">{if $product.thumb}
            <a href="{$product.href}"><img src="{$product.thumb}" alt="{$product.name}" title="{$product.name}" class="img-thumbnail" /></a>
            {/if}</td>
          <td class="text-left"><a href="{$product.href}">{$product.name}</a>
            {if $product.option}
              {foreach from=$product.option item=option}
              <br />
              - <small>{$option.name} {$option.value}</small>
              {/foreach}
            {/if}
            {if $product.recurring}
            <br />
            - <small>{$text_recurring} {$product.recurring}</small>
            {/if}</td>
          <td class="text-right">x {$product.quantity}</td>
          <td class="text-right">{$product.total}</td>
          <td class="text-center"><button type="button" onclick="cart.remove('{$product.key}');" title="{$button_remove}" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
        </tr>
        {/foreach}
        {foreach from=$vouchers item=voucher}
        <tr>
          <td class="text-center"></td>
          <td class="text-left">{$voucher.description}</td>
          <td class="text-right">x&nbsp;1</td>
          <td class="text-right">{$voucher.amount}</td>
          <td class="text-center text-danger"><button type="button" onclick="voucher.remove('{$voucher.key}');" title="{$button_remove}" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
        </tr>
        {/foreach}
      </table>
    </li>
    <li>
      <div>
        <table class="table table-bordered">
          {foreach from=$totals item=total}
          <tr>
            <td class="text-right"><strong>{$total.title}</strong></td>
            <td class="text-right">{$total.text}</td>
          </tr>
          {/foreach}
        </table>
        <p class="text-right"><a href="{$cart}"><strong><i class="fa fa-shopping-cart"></i> {$text_cart}</strong></a>&nbsp;&nbsp;&nbsp;<a href="{$checkout}"><strong><i class="fa fa-share"></i> {$text_checkout}</strong></a></p>
      </div>
    </li>
    {else}
    <li>
      <p class="text-center">{$text_empty}</p>
    </li>
    {/if}
  </ul>
</div>
