<form action="{$action}" method="post">
  {if !$test}
  <input type="hidden" name="merchant_id" value="{$merchant_id}" />
  <input type="hidden" name="success_url" value="{$success_url}" />
  <input type="hidden" name="cancel_url" value="{$cancel_url}" />
  <input type="hidden" name="declined_url" value="{$declined_url}" />
  {else}
  <input type="hidden" name="merchant_id" value="nochex_test" />
  <input type="hidden" name="test_transaction" value="100" />
  <input type="hidden" name="test_success_url" value="{$success_url}" />
  <input type="hidden" name="test_cancel_url" value="{$cancel_url}" />
  <input type="hidden" name="test_declined_url" value="{$declined_url}" />
  <?php } ?>
  <input type="hidden" name="callback_url" value="{$callback_url}" />
  <input type="hidden" name="amount" value="{$amount}" />
  <input type="hidden" name="description" value="{$description}" />
  <input type="hidden" name="order_id" value="{$order_id}" />
  <input type="hidden" name="billing_fullname" value="{$billing_fullname}" />
  <input type="hidden" name="billing_address" value="{$billing_address}" />
  <input type="hidden" name="billing_postcode" value="{$billing_postcode}" />
  <input type="hidden" name="delivery_fullname" value="{$delivery_fullname}" />
  <input type="hidden" name="delivery_address" value="{$delivery_address}" />
  <input type="hidden" name="delivery_postcode" value="{$delivery_postcode}" />
  <input type="hidden" name="customer_phone_number" value="{$customer_phone_number}" />
  <input type="hidden" name="email_address" value="{$email_address}" />
  <input type="hidden" name="hide_billing_details" value="true" />
  <div class="buttons">
    <div class="pull-right">
      <input type="submit" value="{$button_confirm}" class="btn btn-primary" />
    </div>
  </div>
</form>