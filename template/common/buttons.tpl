<div class="buttons clearfix">
  <div class="pull-right">
    {foreach from=$buttons item=button}
      <a href="{$button.link}" class="btn btn-primary">{$button.text}</a>
    {/foreach}
  </div>
</div>