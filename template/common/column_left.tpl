{if $modules}
<column id="column-left" class="col-sm-3 hidden-xs">
  {foreach from=$modules item=module}
  	{$module}
  {/foreach}
</column>
{/if}