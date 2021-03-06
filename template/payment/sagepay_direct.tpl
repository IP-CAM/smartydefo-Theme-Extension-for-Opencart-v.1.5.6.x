<form class="form-horizontal">
  <fieldset id="payment">
    <legend>{$text_credit_card}</legend>
    {if !empty($existing_cards)}
    <div class="form-group">
      <label class="col-sm-2 control-label">{$entry_card}</label>
      <div class="col-sm-10">
        <label class="radio-inline">
          <input type="radio" name="CreateToken" value="0" checked="checked"/>
          {$entry_card_existing} </label>
        <label class="radio-inline">
          <input type="radio" name="CreateToken" value=""/>
          {$entry_card_new} </label>
      </div>
    </div>
    <div id="card-existing">
      <div class="form-group required">
        <label class="col-sm-2 control-label" for="Token">{$entry_cc_choice}</label>
        <div class="col-sm-10">
          <select name="Token" class="form-control">
            {foreach from=$existing_cards item=existing_card}
            <option value="{$existing_card.token}">{$text_card_type . ' ' . $existing_card.type}, {$text_card_digits . ' ' . $existing_card.digits}, {$text_card_expiry . ' ' . $existing_card.expiry}</option>
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
    </div>
    <div  style="display: none" id="card-new">
    {else}
    <div id="card-new">
      <?php } ?>
      <div class="form-group required">
        <label class="col-sm-2 control-label" for="input-cc-owner">{$entry_cc_owner}</label>
        <div class="col-sm-10">
          <input type="text" name="cc_owner" value="" placeholder="{$entry_cc_owner}" id="input-cc-owner" class="form-control" />
        </div>
      </div>
      <div class="form-group required">
        <label class="col-sm-2 control-label" for="input-cc-type">{$entry_cc_type}</label>
        <div class="col-sm-10">
          <select name="cc_type" id="input-cc-type" class="form-control">
            {foreach from=$cards item=card}
            <option value="{$card.value}">{$card.text}</option>
            <?php } ?>
          </select>
        </div>
      </div>
      <div class="form-group required">
        <label class="col-sm-2 control-label" for="input-cc-number">{$entry_cc_number}</label>
        <div class="col-sm-10">
          <input type="text" name="cc_number" value="" placeholder="{$entry_cc_number}" id="input-cc-number" class="form-control" />
        </div>
      </div>
      <div class="form-group required">
        <label class="col-sm-2 control-label" for="input-cc-start-date"><span data-toggle="tooltip" title="{$help_start_date}">{$entry_cc_start_date}</span></label>
        <div class="col-sm-3">
          <select name="cc_start_date_month" id="input-cc-start-date" class="form-control">
            {foreach from=$months item=month}
            <option value="{$month.value}">{$month.text}</option>
            <?php } ?>
          </select>
        </div>
        <div class="col-sm-3">
          <select name="cc_start_date_year" class="form-control">
            {foreach from=$year_valid item=year}
            <option value="{$year.value}">{$year.text}</option>
            <?php } ?>
          </select>
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
      <div class="form-group">
        <label class="col-sm-2 control-label" for="input-cc-issue"><span data-toggle="tooltip" title="{$help_issue}">{$entry_cc_issue}</span></label>
        <div class="col-sm-10">
          <input type="text" name="cc_issue" value="" placeholder="{$entry_cc_issue}" id="input-cc-issue" class="form-control" />
        </div>
      </div>
      {if $sagepay_direct_card}
      <div class="form-group">
        <label class="col-sm-2 control-label" for="input-cc-save">{$entry_card_save}</label>
        <div class="col-sm-2">
          <input type="checkbox" name="CreateToken" value="1" id="input-cc-save"/>
        </div>
      </div>
      <?php } ?>
    </div>
  </fieldset>
</form>
<div class="buttons">
  <div class="pull-right">
    <input type="button" value="{$button_confirm}" id="button-confirm" data-loading-text="{$text_loading}" class="btn btn-primary" />
  </div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
{if !empty($existing_cards)}
			$('#card-new input').prop('disabled', true);
			$('#card-new input').prop('disabled', true);
			$('#card-new select').prop('disabled', true);
<?php } ?>
	});
//</script> 
<script type="text/javascript">
	$('input[name=\'CreateToken\']').on('change', function() {
		if (this.value === '0') {
			$('#card-existing').show();
			$('#card-new').hide();
			$('#card-new input').prop('disabled', true);
			$('#card-new select').prop('disabled', true);
			$('#card-existing select').prop('disabled', false);
			$('#card-existing input').prop('disabled', false);
		} else {
			$('#card-existing').hide();
			$('#card-new').show();
			$('#card-new input').prop('disabled', false);
			$('#card-new select').prop('disabled', false);
			$('#card-existing select').prop('disabled', true);
			$('#card-existing input').prop('disabled', true);
		}
	});
//</script> 
<script type="text/javascript"><!--
$('#button-confirm').bind('click', function() {
		$.ajax({
			url: 'index.php?route=payment/sagepay_direct/send',
			type: 'post',
			data: $('#card-new :input[type=\'text\']:enabled, #card-new select:enabled, #card-new :input[type=\'checkbox\']:checked:enabled, #payment select:enabled, #card-existing :input:enabled'),
			dataType: 'json',
			cache: false,
			beforeSend: function() {
				$('#button-confirm').button('loading');
			},
			complete: function() {
				$('#button-confirm').button('reset');
			},
			success: function(json) {
				if (json['ACSURL']) {
					$('#3dauth').remove();

					html = '<form action="' + json['ACSURL'] + '" method="post" id="3dauth">';
					html += '  <input type="hidden" name="MD" value="' + json['MD'] + '" />';
					html += '  <input type="hidden" name="PaReq" value="' + json['PaReq'] + '" />';
					html += '  <input type="hidden" name="TermUrl" value="' + json['TermUrl'] + '" />';
					html += '</form>';

					$('#payment').after(html);

					$('#3dauth').submit();
				}

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