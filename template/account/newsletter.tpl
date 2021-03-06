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
      <form action="{$action}" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <div class="form-group">
            <label class="col-sm-2 control-label">{$entry_newsletter}</label>
            <div class="col-sm-10">
              {if $newsletter}
              <label class="radio-inline">
                <input type="radio" name="newsletter" value="1" checked="checked" />
                {$text_yes} </label>
              <label class="radio-inline">
                <input type="radio" name="newsletter" value="0" />
                {$text_no}</label>
              {else}
              <label class="radio-inline">
                <input type="radio" name="newsletter" value="1" />
                {$text_yes} </label>
              <label class="radio-inline">
                <input type="radio" name="newsletter" value="0" checked="checked" />
                {$text_no}</label>
              <?php } ?>
            </div>
          </div>
        </fieldset>
        <div class="buttons clearfix">
          <div class="pull-left"><a href="{$back}" class="btn btn-default">{$button_back}</a></div>
          <div class="pull-right">
            <input type="submit" value="{$button_continue}" class="btn btn-primary" />
          </div>
        </div>
      </form>
      {$content_bottom}</div>
    {$column_right}</div>
</div>
{$footer}