{$header}
<div class="container">
  <ul class="breadcrumb">
    {foreach from=$breadcrumbs item=breadcrumb}
    <li><a href="{$breadcrumb.href}">{$breadcrumb.text}</a></li>
    <?php } ?>
  </ul>
  {if $error_warning}
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> {$error_warning}</div>
  <?php } ?>
  <div class="row">{$column_left}
    {if $column_left && $column_right}
    <?php $class = 'col-sm-6'; ?>
    {elseif $column_left || $column_right}
    <?php $class = 'col-sm-9'; ?>
    {else}
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="{$class}">{$content_top}<h2>{$heading_title}</h2>
      <table class="table table-bordered table-hover">
        <thead>
        <tr>
          <td class="text-left" colspan="2">{$text_recurring_detail}</td>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td class="text-left" style="width: 50%;">
            <p><b>{$text_recurring_id}</b> #{$recurring.order_recurring_id}</p>
            <p><b>{$text_date_added}</b> {$recurring.date_added}</p>
            <p><b>{$text_status}</b> {$status_types[$recurring.status]}</p>
            <p><b>{$text_payment_method}</b> {$recurring.payment_method}</p>
          </td>
          <td class="left" style="width: 50%; vertical-align: top;">
            <p><b>{$text_product}</b><a href="{$recurring.product_link}">{$recurring.product_name}</a></p>
            <p><b>{$text_quantity}</b> {$recurring.product_quantity}</p>
            <p><b>{$text_order}</b><a href="{$recurring.order_link}">#{$recurring.order_id}</a></p>
          </td>
        </tr>
        </tbody>
      </table>
      <table class="table table-bordered table-hover">
        <thead>
        <tr>
          <td class="text-left">{$text_recurring_description}</td>
          <td class="text-left">{$text_ref}</td>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td class="text-left" style="width: 50%;">
            <p style="margin:5px;">{$recurring.recurring_description}</p></td>
          <td class="text-left" style="width: 50%;">
            <p style="margin:5px;">{$recurring.reference}</p></td>
        </tr>
        </tbody>
      </table>
      <h2>{$text_transactions}</h2>
      <table class="table table-bordered table-hover">
        <thead>
        <tr>
          <td class="text-left">{$column_date_added}</td>
          <td class="text-center">{$column_type}</td>
          <td class="text-right">{$column_amount}</td>
        </tr>
        </thead>
        <tbody>
        {if !empty($recurring.transactions)}{foreach from=$recurring.transactions item=transaction}
        <tr>
          <td class="text-left">{$transaction.date_added}</td>
          <td class="text-center">{$transaction_types[$transaction.type]}</td>
          <td class="text-right">{$transaction.amount}</td>
        </tr>
        <?php } ?><?php }else{ ?>
        <tr>
          <td colspan="3" class="text-center">{$text_empty_transactions}</td>
        </tr>
        <?php } ?>
        </tbody>
      </table>
      {$buttons}
      {$content_bottom}
    </div>
    {$column_right}
  </div>
</div>
{$footer}