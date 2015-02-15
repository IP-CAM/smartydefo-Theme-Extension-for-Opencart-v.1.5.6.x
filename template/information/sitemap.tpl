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
      <div class="row">
        <div class="col-sm-6">
          <ul>
            {foreach from=$categories item=category_1}
            <li><a href="{$category_1.href}">{$category_1.name}</a>
              {if $category_1.children}
              <ul>
                {foreach from=$category_1.children item=category_2}
                <li><a href="{$category_2.href}">{$category_2.name}</a>
                  {if $category_2.children}
                  <ul>
                    {foreach from=$category_2.children item=category_3}
                    <li><a href="{$category_3.href}">{$category_3.name}</a></li>
                    <?php } ?>
                  </ul>
                  <?php } ?>
                </li>
                <?php } ?>
              </ul>
              <?php } ?>
            </li>
            <?php } ?>
          </ul>
        </div>
        <div class="col-sm-6">
          <ul>
            <li><a href="{$special}">{$text_special}</a></li>
            <li><a href="{$account}">{$text_account}</a>
              <ul>
                <li><a href="{$edit}">{$text_edit}</a></li>
                <li><a href="{$password}">{$text_password}</a></li>
                <li><a href="{$address}">{$text_address}</a></li>
                <li><a href="{$history}">{$text_history}</a></li>
                <li><a href="{$download}">{$text_download}</a></li>
              </ul>
            </li>
            <li><a href="{$cart}">{$text_cart}</a></li>
            <li><a href="{$checkout}">{$text_checkout}</a></li>
            <li><a href="{$search}">{$text_search}</a></li>
            <li>{$text_information}
              <ul>
                {foreach from=$informations item=information}
                <li><a href="{$information.href}">{$information.title}</a></li>
                <?php } ?>
                <li><a href="{$contact}">{$text_contact}</a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
      {$content_bottom}</div>
    {$column_right}</div>
</div>
{$footer}