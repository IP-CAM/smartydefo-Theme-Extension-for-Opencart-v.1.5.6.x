{if !isset($redirect)}
<div class="table-responsive">
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
        <td class="text-left"><a href="{$product.href}">{$product.name}</a>
          {foreach from=$product.option item=option}
          <br />
          &nbsp;<small> - {$option.name}: {$option.value}</small>
          <?php } ?>
          <?php if($product.recurring) { ?>
          <br />
          <span class="label label-info">{$text_recurring_item}</span> <small>{$product.recurring}</small>
          <?php } ?></td>
        <td class="text-left">{$product.model}</td>
        <td class="text-right">{$product.quantity}</td>
        <td class="text-right">{$product.price}</td>
        <td class="text-right">{$product.total}</td>
      </tr>
      <?php } ?>
      {foreach from=$vouchers item=voucher}
      <tr>
        <td class="text-left">{$voucher.description}</td>
        <td class="text-left"></td>
        <td class="text-right">1</td>
        <td class="text-right">{$voucher.amount}</td>
        <td class="text-right">{$voucher.amount}</td>
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
{$payment}
{else}
<script type="text/javascript"><!--
location = '{$redirect}';
//--></script>
<?php } ?>
