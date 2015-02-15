{if count($currencies) > 1}
<div class="pull-left">
<form action="{$action}" method="post" enctype="multipart/form-data" id="currency">
  <div class="btn-group">
    <button class="btn btn-link dropdown-toggle" data-toggle="dropdown">
    {foreach from=$currencies item=currency}
      {if $currency.symbol_left && $currency.code == $code}
      <strong>{$currency.symbol_left}</strong>
      {elseif $currency.symbol_right && $currency.code == $code}
      <strong>{$currency.symbol_right}</strong>
      {/if}
    {/foreach}
    <span class="hidden-xs hidden-sm hidden-md">{$text_currency}</span> <i class="fa fa-caret-down"></i></button>
    <ul class="dropdown-menu">
      {foreach from=$currencies item=currency}
        {if $currency.symbol_left}
        <li><button class="currency-select btn btn-link btn-block" type="button" name="{$currency.code}">{$currency.symbol_left} {$currency.title}</button></li>
        {else}
        <li><button class="currency-select btn btn-link btn-block" type="button" name="{$currency.code}">{$currency.symbol_right} {$currency.title}</button></li>
        {/if}
      {/foreach}
    </ul>
  </div>
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="{$redirect}" />
</form>
</div>
{/if}
