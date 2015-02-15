{$header}
<div class="container">
  <ul class="breadcrumb">
    {foreach from=$breadcrumbs item=breadcrumb}
    <li><a href="{$breadcrumb.href}">{$breadcrumb.text}</a></li>
    <?php } ?>
  </ul>
  <div class="row">{$column_left}
    {if $column_left && $column_right}
    <?php $class = 'col-sm-6'; ?>
    {elseif $column_left || $column_right}
    <?php $class = 'col-sm-9'; ?>
    {else}
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="{$class}">{$content_top}
      <h1>{$heading_title}</h1>
      {if $returns}
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-right">{$column_return_id}</td>
            <td class="text-left">{$column_status}</td>
            <td class="text-left">{$column_date_added}</td>
            <td class="text-right">{$column_order_id}</td>
            <td class="text-left">{$column_customer}</td>
            <td></td>
          </tr>
        </thead>
        <tbody>
          {foreach from=$returns item=return}
          <tr>
            <td class="text-right">#{$return.return_id}</td>
            <td class="text-left">{$return.status}</td>
            <td class="text-left">{$return.date_added}</td>
            <td class="text-right">{$return.order_id}</td>
            <td class="text-left">{$return.name}</td>
            <td><a href="{$return.href}" data-toggle="tooltip" title="{$button_view}" class="btn btn-info"><i class="fa fa-eye"></i></a></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
      <div class="text-right">{$pagination}</div>
      {else}
      <p>{$text_empty}</p>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="{$continue}" class="btn btn-primary">{$button_continue}</a></div>
      </div>
      {$content_bottom}</div>
    {$column_right}</div>
</div>
{$footer}