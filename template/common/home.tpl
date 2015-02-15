{$header}
<div class="container">
    <div class="row">{$column_left}
        {if $column_left && $column_right}
            {assign var="class" value="col-sm-6"}
        {elseif $column_left || $column_right}
            {assign var="class" value="col-sm-9"}
        {else}
            {assign var="class" value="col-sm-12"}
        {/if}
        <div id="content" class="{$class}">
            {$content_top}
            {$content_bottom}
        </div>
        {$column_right}
    </div>
</div>
{$footer}