<h2>{page_title}</h2>
<p>{pages_description}</p>
<div>
	<form name="pages_action" id="pages_action" method="post" action="{form_url}">
<table class="widefat">
    <tbody id="the-list">   
    <tr>
		<td width="20%">{page_name_title}</td>
        <td>
        	<!-- START BLOCK : page_title -->
			<div width="40%">
            	<div style="vertical-align:middle; padding:10"><img src="{language_icon_url}"/></div>
                <div style="vertical-align:middle; padding:10">
				<input name="page_name_{language_code_sufix}" value="{page_name_value}" size="50" type="text" /></div>
			</div>
            <!-- END BLOCK : page_title -->
        	<div><i>{pages_title_warning}</i></div>
        </td>
	</tr>
    
    <tr>
		<td>{page_code_title}</td>
        <td><input name="page_code" value="{page_code_value}" id="page_code" size="50" type="text" /></td>
	</tr>
    
     <tr>
		<td valign="top">{page_description}</td>
        <td>
        <!-- START BLOCK : page_description -->
        <div style="vertical-align:middle; padding:10"><img src="{language_icon_url}"/></div>
        <div><textarea name="page_description_{language_code_sufix}"  cols="48" rows="4">{page_description_value}</textarea></div>
         <!-- END BLOCK : page_description -->
        </td>
	</tr>
     <tr>
		<td valign="top">{html_file}<br />{html_file_comment}</td>
        <td>
        	<table class="widefat" bgcolor="#ffffff">
           	<tbody id="the-list">
        	<!-- START BLOCK : html_file -->
            <tr class='{odd_row}' valign="middle"><td>
            <div style="vertical-align:top"><label>
            	<input type="radio" value="{value}" name="html_file" id="html_file" {attribute}/>  
            {html_file_name_title}</label>
            </div>
            </td></tr>
            <!-- END BLOCK : html_file -->
            </tbody>
            </table>
        </td>
	</tr>
    </tbody>
</table>
<div id="button" align="right">
	<input type="hidden" name="pages_id" value="{hidden_field_pages_id_value}" />
	<input type="hidden" name="action" value="{action}"/>
  	<input class="button" type="submit" value="{action_page_button_text}" />
</div>
</form>
</div>