<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script type="text/javascript" src="../editor/ckeditor.js"></script>
<script src="../editor/filemanagement/ckfinder.js" type="text/javascript"></script>
<style type="text/css">
	select {
		width: 300px;
		height: 30px;
	}
	fieldset{
	  -moz-border-radius: 5px;
	  margin-bottom: 20px;
	}
	input[type=text]{
	  width: 300px;
	  height: 30px;
	}
	input[type=button]{
    width: 100px;
    height: 30px;
  }
	label{
	  margin-right: 20px;
	  width: 100px;
	  display: inline-block;
	  text-align: left ;
	}
	body{
	  font-size: 14px;
	}
</style>
<h2 class="ic-tagblue">{LBL_PAGE_TITLE}</h2>
<span style="color: red;">MÔ TẢ SẢN PHẨM</span>
<div class="pad-lr">
    <form name="news_item" id="news_item" method="post" action="{action}">
        <fieldset>
            <legend>
                <h2>DESCRIPTION</h2>
            </legend>
            <p>
		        <br/>
		        {ck_description}               
            </p>

        </fieldset>
        <div id="button" align="center" style="width:100%; float:left;">
            <a name="page_action"></a>
            <input class="btn-green radius" type="submit" value="Submit"/>
        </div>
		<input type="hidden" name="oper" value="{oper}" />
		<input type="hidden" name="id" value="{id}" />
    </form>
</div>
