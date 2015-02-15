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
      <h3>{$text_location}</h3>
      <div class="panel panel-default">
        <div class="panel-body">
          <div class="row">
            {if $image}
            <div class="col-sm-3"><img src="{$image}" alt="{$store}" title="{$store}" class="img-thumbnail" /></div>
            <?php } ?>
            <div class="col-sm-3"><strong>{$store}</strong><br />
              <address>
              {$address}
              </address>
              {if $geocode}
              <a href="https://maps.google.com/maps?q={urlencode($geocode)}&hl=en&t=m&z=15" target="_blank" class="btn btn-info"><i class="fa fa-map-marker"></i> {$button_map}</a>
              <?php } ?>
            </div>
            <div class="col-sm-3"><strong>{$text_telephone}</strong><br>
              {$telephone}<br />
              <br />
              {if $fax}
              <strong>{$text_fax}</strong><br>
              {$fax}
              <?php } ?>
            </div>
            <div class="col-sm-3">
              {if $open}
              <strong>{$text_open}</strong><br />
              {$open}<br />
              <br />
              <?php } ?>
              {if $comment}
              <strong>{$text_comment}</strong><br />
              {$comment}
              <?php } ?>
            </div>
          </div>
        </div>
      </div>
      {if $locations}
      <h3>{$text_store}</h3>
      <div class="panel-group" id="accordion">
        {foreach from=$locations item=location}
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title"><a href="#collapse-location{$location.location_id}" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion">{$location.name} <i class="fa fa-caret-down"></i></a></h4>
          </div>
          <div class="panel-collapse collapse" id="collapse-location{$location.location_id}">
            <div class="panel-body">
              <div class="row">
                {if $location.image}
                <div class="col-sm-3"><img src="{$location.image}" alt="{$location.name}" title="{$location.name}" class="img-thumbnail" /></div>
                <?php } ?>
                <div class="col-sm-3"><strong>{$location.name}</strong><br />
                  <address>
                  {$location.address}
                  </address>
                  {if $location.geocode}
                  <a href="https://maps.google.com/maps?q={urlencode($location.geocode)}&hl=en&t=m&z=15" target="_blank" class="btn btn-info"><i class="fa fa-map-marker"></i> {$button_map}</a>
                  <?php } ?>
                </div>
                <div class="col-sm-3"> <strong>{$text_telephone}</strong><br>
                  {$location.telephone}<br />
                  <br />
                  {if $location.fax}
                  <strong>{$text_fax}</strong><br>
                  {$location.fax}
                  <?php } ?>
                </div>
                <div class="col-sm-3">
                  {if $location.open}
                  <strong>{$text_open}</strong><br />
                  {$location.open}<br />
                  <br />
                  <?php } ?>
                  {if $location.comment}
                  <strong>{$text_comment}</strong><br />
                  {$location.comment}
                  <?php } ?>
                </div>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <form action="{$action}" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <h3>{$text_contact}</h3>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-name">{$entry_name}</label>
            <div class="col-sm-10">
              <input type="text" name="name" value="{$name}" id="input-name" class="form-control" />
              {if $error_name}
              <div class="text-danger">{$error_name}</div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-email">{$entry_email}</label>
            <div class="col-sm-10">
              <input type="text" name="email" value="{$email}" id="input-email" class="form-control" />
              {if $error_email}
              <div class="text-danger">{$error_email}</div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-enquiry">{$entry_enquiry}</label>
            <div class="col-sm-10">
              <textarea name="enquiry" rows="10" id="input-enquiry" class="form-control">{$enquiry}</textarea>
              {if $error_enquiry}
              <div class="text-danger">{$error_enquiry}</div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-captcha">{$entry_captcha}</label>
            <div class="col-sm-10">
              <input type="text" name="captcha" id="input-captcha" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-10 pull-right">
              <img src="index.php?route=tool/captcha" alt="" />
              {if $error_captcha}
                <div class="text-danger">{$error_captcha}</div>
              <?php } ?>
            </div>
          </div>
        </fieldset>
        <div class="buttons">
          <div class="pull-right">
            <input class="btn btn-primary" type="submit" value="{$button_submit}" />
          </div>
        </div>
      </form>
      {$content_bottom}</div>
    {$column_right}</div>
</div>
{$footer}
