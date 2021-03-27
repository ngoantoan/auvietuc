<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>{site_title} - Administrator &rsaquo; {page_title}</title>
<script type="text/javascript" src="{site_js_url}/json2.js"></script>
<script type="text/javascript" src="{site_js_url}/lib/prototype2.js"></script>
<script src="{site_js_url}/lib/prototype.js" type="text/javascript"></script>
<script src="{site_js_url}/src/effects.js" type="text/javascript"></script>

<script type="text/javascript" src="languages/{language}/js/validation.js"></script>
<link rel="stylesheet" type="text/css" href="{location}/css/validation.css" />
<script type="text/javascript">

//<![CDATA[
function addLoadEvent(func) {
	if ( typeof Onload!='function') {
		Onload=func;
	} else { 
		var oldonload=Onload;
		Onload=function() {
			if (oldonload) {
				oldonload();
			}
			func();
		}
	}
}
//]]>
</script>
<script type="text/javascript" src="{location}/js/fat.js?ver=1.0-RC1_3660"></script>
<link rel="stylesheet" href="{location}/css/template.css" type="text/css"/>
<style type="text/css">
h2 {
	color: #333;
	font: normal 32px Verdana, Tahoma;
	margin: 5px 10px;
	background: url('{location}/images/heading-bg.gif') repeat-x bottom;
}

.submit input, .submit input:focus, .button, .button:focus {
	background: url('{location}/images/fade-butt.png');
	border: 3px double #999;
	border-left-color: #ccc;
	border-top-color: #ccc;
	color: #333;
	padding: 0.25em;
}

.updated, .confirm {
	background: #CFEBF7 url('{location}/images/notice.gif') no-repeat 1em;
	border: 1px solid #2580B2;
	margin: 1em 5% 10px;
	padding: 0 1em 0 3em;
}

#ed_toolbar input {
	background: #fff url('{location}/images/fade-butt.png') repeat-x 0 -2px;
	margin: 3px 2px 2px;
}

#footer {
	clear: both;
	height: 35px;
	padding-left: 40px;
	margin: 15px 5%;
	background: url('{location}/images/logo-ghost.png') no-repeat top left;
}

#moremeta .dbx-content {
	background: url('{location}/images/box-butt.gif') no-repeat bottom right;
	padding-bottom: 15px;
	padding-right: 2px;
}

#moremeta fieldset.dbx-box-closed {
	background: url('{location}/images/box-butt.gif') no-repeat bottom;
	padding-bottom: 9px;
}

#moremeta .dbx-handle {
	padding: 6px 1em 2px;
	font-size: 10px;
	background: #2685af url('{location}/images/box-head.gif') no-repeat right;
}

#moremeta .dbx-box {
	background: url('{location}/images/box-bg.gif') repeat-y right;
}

#advancedstuff h3.dbx-handle {
	margin-left: 7px;
	margin-bottom: -7px;
	padding: 6px 1em 0 3px;
	height: 19px;
	font-size: 10px;
	background: #2685af url('{location}/images/box-head-right.gif') no-repeat top right;
}

#advancedstuff div.dbx-h-andle-wrapper {
	margin: 0 0 0 -7px;
	background: #fff url('{location}/images/box-head-left.gif') no-repeat top left;
}

#advancedstuff div.dbx-content {
	margin-left: 8px;
	background: url('{location}/images/box-bg-right.gif') repeat-y right;
	padding: 10px 10px 15px 0;
}

#advancedstuff div.dbx-c-ontent-wrapper {
	margin-left: -7px;
	margin-right: 0;
	background: url('{location}/images/box-bg-left.gif') repeat-y left;
}

#advancedstuff fieldset.dbx-box {
	padding-bottom: 9px;
	margin-left: 6px;
	background: url('{location}/images/box-butt-right.gif') no-repeat bottom right;
}

#advancedstuff div.dbx-b-ox-wrapper {
	background: url('{location}/images/box-butt-left.gif') no-repeat bottom left;
}

#advancedstuff .dbx-box-closed div.dbx-c-ontent-wrapper {
	padding-bottom: 2px;
	background: url('{location}/images/box-butt-left.gif') no-repeat bottom left;
}

#advancedstuff .dbx-box {
	background: url('{location}/images/box-butt-right.gif') no-repeat bottom right;
}

a.dbx-toggle, a.dbx-toggle:visited {
	display: block;
	overflow: hidden;
	background-image: url('{location}/images/toggle.gif');
	position: absolute;
	top: 0;
	right: 0;
	background-repeat: no-repeat;
	border: 0;
	margin: 0;
	padding: 0;
}

#edButtons input.edButtonBack, #edButtons input.edButtonBack:active {
	background: #fff url('{location}/images/fade-butt.png') repeat-x 0 15px;
	border-bottom: 1px solid #ccc;
}

.reorder {
	cursor:pointer;
}
th.reorder:hover {
	background-color: rgb(180,180,180);
}
th.reorder:active {
	background-color: rgb(180,180,180);
}

</style>
{javascript}
</head>

<body class="admin" onload="javascript:parent.document.title=document.title;">
<script type="text/javascript" src="{site_js_url}/wz_tooltip.js"></script>
<!-- START BLOCK : message -->
<div id="message_box">{message}</div>
<!-- END BLOCK : message -->
<div class="wrap">
<div id="preload" style="display:none;position:absolute; top:40%; left:40%; z-index:5;"><img src="{location}/images/loading.gif" style="border:0px;"></div>
<div id="page_content">
{page_content}
</div>
</div>
<script type="text/javascript">if(typeof Onload=='function') Onload();</script>
</body>