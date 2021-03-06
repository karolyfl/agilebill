

{$method->exe("campaign","search_show")}
{if ($method->result == FALSE)}
    {$block->display("core:method_error")}
{else}
    {if $results == 1}
        {translate results=$results}search_result_count{/translate}
    {else}
        {translate results=$results}search_results_count{/translate}
    {/if}
  <BR>


  {literal}
    <script language="JavaScript">
    <!-- START
    	var module 		= 'campaign';		
    	{/literal}
    	{if $VAR._print == TRUE}
    	var p 			= '&_escape=y&_print=y';
    	{else}
    	var p 			= '';
    	{/if}{literal}
    	var IMAGE 		= '{/literal}{$NONSSL_IMAGE}{literal}';
    	var order 		= '{/literal}{$order}{literal}';
    	var sort1  		= '{/literal}{$sort}{literal}';
    	var search_id 	= '{/literal}{$search_id}{literal}';
    	var page 		= {/literal}{$page}{literal};
    	var pages		= '{/literal}{$pages}{literal}';
    	var results		= '{/literal}{$results}{literal}';
    	var limit 		= '{/literal}{$limit}{literal}';
    	record_arr = new Array ({/literal}{$limit}{literal});
    	var i = 0;	
    //  END -->
    </script>
    <SCRIPT SRC="themes/{/literal}{$THEME_NAME}{literal}/search.js"></SCRIPT>
    {/literal}

    <!-- SHOW THE SEARCH NAVIGATION MENU -->
    <center><script language="JavaScript">document.write(search_nav_top());</script></center>

<!-- BEGIN THE RESULTS CONTENT AREA -->
<div id="search_results" onKeyPress="key_handler(event);">
 <table id="main1" width="100%" border="0" cellspacing="0" cellpadding="0" class="table_background">
  <form id="form1" name="form1" method="post" action="">
    <tr>
      <td>
          <table id="main2" width="100%" border="0" cellspacing="1" cellpadding="3">
            <!-- DISPLAY THE SEARCH HEADING -->
            <tr valign="middle" align="center" class="table_heading"> 
              <td width="1%" class="table_heading">&nbsp;</td>
              <td width="15%" class="table_heading"> 
                {literal}
                <script language="JavaScript">
					document.write(search_heading('{/literal}{translate module=campaign}field_name{/translate}{literal}','name'));
				 </script>
                {/literal}
              </td>
              <td width="8%" class="table_heading">
                {translate module=campaign}
                cost
                {/translate}
              </td>
              <td width="8%" class="table_heading"> 
                {translate module=campaign}
                impr 
                {/translate}
              </td>
              <td width="8%" class="table_heading"> 
                {translate module=campaign}
                clicks 
                {/translate}
              </td>
              <td width="8%" class="table_heading"> 
                {translate module=campaign}
                cpc 
                {/translate}
              </td>
              <td width="8%" class="table_heading"> 
                {translate module=campaign}
                cpi 
                {/translate}
              </td>
              <td width="8%" class="table_heading"> 
                {translate module=campaign}
                conversion 
                {/translate}
              </td>
              <td width="8%" class="table_heading"> 
                {translate module=campaign}
                cost_conv 
                {/translate}
              </td>
              <td width="8%" class="table_heading"> 
                {translate module=campaign}
                roi_s 
                {/translate}
              </td>
              <td width="8%" class="table_heading"> 
                {translate module=campaign}
                avg_sale_s 
                {/translate}
              </td>
              <td width="12%" class="table_heading"> 
                {translate module=campaign}
                revenue 
                {/translate}
              </td>
              <!-- LOOP THROUGH EACH RECORD -->
              {foreach from=$campaign item=record}
            <tr id="row{$record.id}" onClick="row_sel('{$record.id}',1);" onDblClick="window.location='?_page=campaign:view&id={$record.id},';" onMouseOver="row_mouseover('{$record.id}', 'row_mouse_over_select', 'row_mouse_over');" onMouseOut="row_mouseout('{$record.id}', '{$record._C}', 'row_select');" class="{$record._C}"> 
              <td align="center" width="1%"> 
                <input type="checkbox" name="record{$record.id}" value="{$record.id}" onClick="row_sel('{$record.id}',1,'{$record._C}');">
              </td>
              <td width="15%">&nbsp;
                {$record.name}
              </td>
              <td width="8%">
                {$list->format_currency_num($record.budget,"")}
              </td>
              <td width="8%">
                {$record.impressions_total|number_format}
              </td>
              <td width="8%"> 
                {$record.clicks_total|number_format}
              </td>
              <td width="8%"> 
                {$list->format_currency_num($record.cpc_avg,"")}
              </td>
              <td width="8%">
                {$list->format_currency_num($record.cpi_avg, "")}
              </td>
              <td width="8%"> 
                {$record.ctr_avg}
              </td>
              <td width="8%"> 
                {$list->format_currency_num($record.conversion_cost,"")}
              </td>
              <td width="8%">
                {$record.roi}
              </td>
              <td width="8%"> 
                {$list->format_currency_num($record.invoice_avg,"")}
              </td>
              <td width="12%"> 
                {$list->format_currency_num($record.invoices_revenue,"")}
                (<a href="?_page=core:search&module=invoice&invoice_campaign_id={$record.id}"> 
                {$record.invoices_referred}
                </a>) </td>
            </tr>
            {literal}
            <script language="JavaScript">row_sel('{/literal}{$record.id}{literal}', 0, '{/literal}{$record._C}{literal}'); record_arr[i] = '{/literal}{$record.id}{literal}'; i++; </script>
            {/literal}
            {/foreach}
            <!-- END OF RESULT LOOP -->
          </table>
      </td>
    </tr>
  </form>
 </table>
{if $VAR._print != TRUE}<br>
<center>
<input type="submit" name="Submit" value="{translate}view_edit{/translate}" 	onClick="mass_do('', module+':view', limit, module);" 		class="form_button">
<input type="submit" name="Submit" value="{translate}delete{/translate}" 		onClick="mass_do('delete', module+':search_show&search_id={$search_id}&page={$page}&order_by={$order}&{$sort}', limit, module);" class="form_button">
<input type="submit" name="Submit" value="{translate}select_all{/translate}" 	onClick="all_select(record_arr);" 		class="form_button">
<input type="submit" name="Submit" value="{translate}deselect_all{/translate}" 	onClick="all_deselect(record_arr);" 	class="form_button">
<input type="submit" name="Submit" value="{translate}range_select{/translate}" 	onClick="all_range_select(record_arr,limit);" class="form_button">
<br>
<br>
<table width="100%" border="0" cellspacing="0" cellpadding="5" align="center">
  <tr>
        <td valign="middle" align="center"> <a href="#" onClick="NewWindow('ExportWin','toolbar=no,status=no,width=300,height=300','?_page=core:export_search&module=campaign&_escape=1&search_id={$search_id}&page={$page}&order={$order}&sort={$sort}');"><img src="themes/{$THEME_NAME}/images/icons/exp_32.gif" alt="{translate}search_export_image{/translate}" border="0"></a> 
          <a href="?_page=campaign:search_show&_print=true&order_by={$order}&search_id={$search_id}&limit={$limit}&page={$page}"><img src="themes/{$THEME_NAME}/images/icons/print_32.gif" border="0" alt="{translate}search_print_image{/translate}"></a> 
          <a href="#" onClick="NewWindow('SaveSearchWin','toolbar=no,status=no,width=200,height=150','?_page=core:save_search&_escape=&search_id={$search_id}&module=campaign:search_save');"> 
          </a> <a href="?_page=campaign:search_form"><img src="themes/{$THEME_NAME}/images/icons/srch_32.gif" border="0" alt="{translate}search_new_image{/translate}"></a> 
          <a href="?_page=campaign:add"><img src="themes/{$THEME_NAME}/images/icons/add_32.gif" border="0" alt="{translate module=campaign}title_add{/translate}"></a> 
        </td>
  </tr>
</table>
</center>
{/if}
{/if}
</div>
