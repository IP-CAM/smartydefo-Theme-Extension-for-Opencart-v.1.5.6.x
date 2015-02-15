{$header}
<div class="container">
  <ul class="breadcrumb">
    {foreach from=$breadcrumbs item=breadcrumb}
    <li><a href="{$breadcrumb.href}">{$breadcrumb.text}</a></li>
    {/foreach}
  </ul>
  <div class="row">{$column_left}
    {if $column_left && $column_right}
      {assign var="class" value="col-sm-6"}
    {elseif $column_left || $column_right}
      {assign var="class" value="col-sm-9"}
    {else}
      {assign var="class" value="col-sm-12"}
    {/if}
    <div id="content" class="{$class}">{$content_top}
      <h1>{$heading_title}</h1>
      {$text_message}
      <div class="buttons">
        <div class="pull-right"><a href="{$continue}" class="btn btn-primary">{$button_continue}</a></div>
      </div>
      {$content_bottom}</div>
    {$column_right}</div>
</div>
{$footer}