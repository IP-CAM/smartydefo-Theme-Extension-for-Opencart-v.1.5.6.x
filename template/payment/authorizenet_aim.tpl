<form id="payment" class="form-horizontal">
  <fieldset>
    <legend>{$text_credit_card}</legend>
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-cc-owner">{$entry_cc_owner}</label>
      <div class="col-sm-10">
        <input type="text" name="cc_owner" value="" placeholder="{$entry_cc_owner}" id="input-cc-owner" class="form-control" />
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-cc-number">{$entry_cc_number}</label>
      <div class="col-sm-10">
        <input type="text" name="cc_number" value="" placeholder="{$entry_cc_number}" id="input-cc-number" class="form-control" />
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-cc-expire-date">{$entry_cc_expire_date}</label>
      <div class="col-sm-3">
        <select name="cc_expire_date_month" id="input-cc-expire-date" class="form-control">
          {foreach from=$months item=month}
          <option value="{$month.value}">{$month.text}</option>
          <?php } ?>
        </select>
       </div>
       <div class="col-sm-3">
        <select name="cc_expire_date_year" class="form-control">
          {foreach from=$year_expire item=year}
          <option value="{$year.value}">{$year.text}</option>
          <?php } ?>
        </select>
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-cc-cvv2">{$entry_cc_cvv2}</label>
      <div class="col-sm-10">
        <input type="text" name="cc_cvv2" value="" placeholder="{$entry_cc_cvv2}" id="input-cc-cvv2" class="form-control" />
      </div>
    </div>
  </fieldset>
</form>
<div class="buttons">
  <div class="pull-right">
    <input type="button" value="{$button_confirm}" id="button-confirm" class="btn btn-primary" />
  </div>
</div>
<script type="text/javascript"><!--
$('#button-confirm').on('click', function() {
	$.ajax({
		url: 'index.php?route=payment/authorizenet_aim/send',
		type: 'post',
		data: $('#payment :input'),
		dataType: 'json',
		cache: false,		
		beforeSend: function() {
			$('#button-confirm').button('loading');
		},
		complete: function() {
			$('#button-confirm').button('reset');
		},				
		success: function(json) {
			if (json['error']) {
				alert(json['error']);
			}
			
			if (json['redirect']) {
				location = json['redirect'];
			}
		}
	});
});
//--></script>