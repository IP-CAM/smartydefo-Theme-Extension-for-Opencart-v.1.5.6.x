{$header}{$column_left}{$column_right}
<div class="container">{$content_top}
  <form class="payment-form" method="POST" action="{$process_order}">
    <div style="text-align:center;">
      <h3>{$heading_confirm}</h3>
      <div style="display: inline-block;" id="amazon-address-widget"></div>
      <div style="display: inline-block;" id="amazon-wallet-widget"></div>
    </div>
    <div style="clear: both;"></div>
  </form>
  <div class="checkout-product" style="margin-top: 15px">
    <table class="table table-bordered table-hover">
      <thead>
        <tr>
          <td class="text-left">{$column_name}</td>
          <td class="text-left">{$column_model}</td>
          <td class="text-right">{$column_quantity}</td>
          <td class="text-right">{$column_price}</td>
          <td class="text-right">{$column_total}</td>
        </tr>
      </thead>
      <tbody>
        {foreach from=$products item=product}
          <tr>
            <td class="text-left">{$product.name}
              {foreach from=$product.option item=option}
                <br />
                &nbsp;<small> - {$option.name}: {$option.value}</small>
              <?php } ?></td>
            <td class="text-left">{$product.model}</td>
            <td class="text-right">{$product.quantity}</td>
            <td class="text-right">{$product.price}</td>
            <td class="text-right">{$product.total}</td>
          </tr>
        <?php } ?>
      </tbody>
      <tfoot>
        {foreach from=$totals item=total}
          <tr>
            <td colspan="4" class="text-right"><strong>{$total.title}:</strong></td>
            <td class="text-right">{$total.text}</td>
          </tr>
        <?php } ?>
      </tfoot>
    </table>
  </div>
  <div class="buttons">
    <div class="pull-left">
	  <a href="{$back}" class="btn btn-primary">{$text_back}</a>
    </div>
    <div class="pull-right">
      <input class="btn btn-primary" id="confirm-button" type="submit" value="{$text_confirm}" />
    </div>
  </div>
  {$content_bottom}
</div>
<script type="text/javascript"><!--
  $(document).ready(function(){
    new CBA.Widgets.AddressWidget({
      merchantId: '{$merchant_id}',
      displayMode: 'read'
    }).render('amazon-address-widget');

    new CBA.Widgets.WalletWidget({
      merchantId: '{$merchant_id}',
      displayMode: 'read'
    }).render('amazon-wallet-widget');

    $('#confirm-button').click(function(){
      if ($(this).attr('disabled') != 'disabled') {
        $('.payment-form').submit();
      }

      $(this).attr('disabled', 'disabled');
    });
  });
//--></script>
{$footer}