<?php
include 'includes/captcha/securimage.php';

$img = new securimage();

//Change some settings
$img->image_width = 150;
$img->image_height = 50;
$img->perturbation = 0.9;
$img->code_length = rand(4,4);
$img->image_bg_color = new Securimage_Color("#ffffff");
$img->use_transparent_text = true;
$img->text_transparency_percentage = 75; // 100 = completely transparent
$img->num_lines = 5;
$img->image_signature = '';
$img->text_color = new Securimage_Color("#0033CC");
$img->line_color = new Securimage_Color("#cccccc");

$img->show(''); // alternate use:  $img->show('/path/to/background_image.jpg');

?>