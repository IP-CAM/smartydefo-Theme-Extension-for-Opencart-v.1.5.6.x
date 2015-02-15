<div class="list-group">
  {foreach from=$categories item=category}
  {if $category.category_id == $category_id}
  <a href="{$category.href}" class="list-group-item active">{$category.name}</a>
  {if $category.children}
  {foreach from=$category.children item=child}
  {if $child.category_id == $child_id}
  <a href="{$child.href}" class="list-group-item active">&nbsp;&nbsp;&nbsp;- {$child.name}</a>
  {else}
  <a href="{$child.href}" class="list-group-item">&nbsp;&nbsp;&nbsp;- {$child.name}</a>
  <?php } ?>
  <?php } ?>
  <?php } ?>
  {else}
  <a href="{$category.href}" class="list-group-item">{$category.name}</a>
  <?php } ?>
  <?php } ?>
</div>
