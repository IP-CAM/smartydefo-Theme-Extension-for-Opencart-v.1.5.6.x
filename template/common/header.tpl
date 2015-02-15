<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="{$direction}" lang="{$lang}" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="{$direction}" lang="{$lang}" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="{$direction}" lang="{$lang}">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>{$title}</title>
<base href="{$base}" />
{if $description}
<meta name="description" content="{$description}" />
{/if}
{if $keywords}
<meta name="keywords" content= "{$keywords}" />
{/if}
<meta http-equiv="X-UA-Compatible" content="IE=edge">
{if $icon}
<link href="{$icon}" rel="icon" />
{/if}
{foreach from=$links item=link}
<link href="{$link.href}" rel="{$link.rel}" />
{/foreach}
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
{foreach from=$styles item=style}
<link href="{$style.href}" type="text/css" rel="{$style.rel}" media="{$style.media}" />
{/foreach}
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
{foreach from=$scripts item=script}
<script src="{$script}" type="text/javascript"></script>
{/foreach}
{$google_analytics}
</head>
<body class="{$class}">
<nav id="top">
  <div class="container">
    {$currency}
    {$language}
    <div id="top-links" class="nav pull-right">
      <ul class="list-inline">
        <li><a href="{$contact}"><i class="fa fa-phone"></i></a> <span class="hidden-xs hidden-sm hidden-md">{$telephone}</span></li>
        <li class="dropdown"><a href="{$account}" title="{$text_account}" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <span class="hidden-xs hidden-sm hidden-md">{$text_account}</span> <span class="caret"></span></a>
          <ul class="dropdown-menu dropdown-menu-right">
            {if $logged}
            <li><a href="{$account}">{$text_account}</a></li>
            <li><a href="{$order}">{$text_order}</a></li>
            <li><a href="{$transaction}">{$text_transaction}</a></li>
            <li><a href="{$download}">{$text_download}</a></li>
            <li><a href="{$logout}">{$text_logout}</a></li>
            {else}
            <li><a href="{$register}">{$text_register}</a></li>
            <li><a href="{$login}">{$text_login}</a></li>
            {/if}
          </ul>
        </li>
        <li><a href="{$wishlist}" id="wishlist-total" title="{$text_wishlist}"><i class="fa fa-heart"></i> <span class="hidden-xs hidden-sm hidden-md">{$text_wishlist}</span></a></li>
        <li><a href="{$shopping_cart}" title="{$text_shopping_cart}"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md">{$text_shopping_cart}</span></a></li>
        <li><a href="{$checkout}" title="{$text_checkout}"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md">{$text_checkout}</span></a></li>
      </ul>
    </div>
  </div>
</nav>
<header>
  <div class="container">
    <div class="row">
      <div class="col-sm-4">
        <div id="logo">
          {if $logo}
          <a href="{$home}"><img src="{$logo}" title="{$name}" alt="{$name}" class="img-responsive" /></a>
          {else}
          <h1><a href="{$home}">{$name}</a></h1>
          {/if}
        </div>
      </div>
      <div class="col-sm-5">{$search}
      </div>
      <div class="col-sm-3">{$cart}</div>
    </div>
  </div>
</header>
{if $categories}
<div class="container">
  <nav id="menu" class="navbar">
    <div class="navbar-header"><span id="category" class="visible-xs">{$text_category}</span>
      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
    </div>
    <div class="collapse navbar-collapse navbar-ex1-collapse">
      <ul class="nav navbar-nav">
        {foreach from=$categories item=category}
        {if $category.children}
        <li class="dropdown"><a href="{$category.href}" class="dropdown-toggle" data-toggle="dropdown">{$category.name}</a>
          <div class="dropdown-menu">
            <div class="dropdown-inner">
              {foreach from=array_chunk($category.children, ceil(count($category.children) / $category.column)) item=children}
              <ul class="list-unstyled">
                {foreach from=$children item=child}
                <li><a href="{$child.href}">{$child.name}</a></li>
                {/foreach}
              </ul>
              {/foreach}
            </div>
            <a href="{$category.href}" class="see-all">{$text_all} {$category.name}</a> </div>
        </li>
        {else}
        <li><a href="{$category.href}">{$category.name}</a></li>
        {/if}
        {/foreach}
      </ul>
    </div>
  </nav>
</div>
{/if}
