<?php
/*
 * Date: 23/09/2010
 * Change Log:
 *
 * EX:
 * 
 * HTML: 
 *  <form enctype="multipart/form-data" method="post" >
 *    <input type="file" size="30" name="logo" class="inputbox" id="logo">
 *    <input type="submit" class="button" value="Đăng ký" tabindex="0">
 *  </form>
 * 
 * PHP:
 *  include_once("includes/class.upload_file.php");
 *  $uploadFile = new UploadFile();
 *  $mix = $uploadFile->upload('logo',getDocumentRootPath().$this->site_folder."/upload/images/users/PHUCTEST/");
*/

Class UploadFile {
  
  private $allowExt = array('.bmp', '.gif', '.jpg', 'jpeg', '.png','swf');
  private $maxSize = 3;//default 3MB
  private $err = array();
  
  /**
   * @param[optional] Int $maxSize (MB)
   * @param[optional] array $allowExt array('.bmp', '.gif', '.jpg', 'jpeg', '.png')
   */
  function UploadFile($maxSize = "", $allowExt = ""){
      ($allowExt == "")?$this->allowExt: ($this->allowExt = $allowExt);
      ($maxSize == "")?$this->maxSize: ($this->maxSize = $maxSize);
  }
  
  /**
   * Set Allow Extension
   * @param array $allowExt array('.bmp', '.gif', '.jpg', 'jpeg', '.png')
   */
  function setAllowExt($allowExt){
    $this->allowExt = $allowExt;
  }
  function watermarkLogo ($SourceFile,$DestinationFile) {
  	//$SourceFile = '/home/user/www/images/image1.jpg';
	//$DestinationFile = '/home/user/www/images/image1-watermark.jpg';
	//$WaterMarkText = 'Copyright phpJabbers.com';
   //$img_id= substr( ?'.$_GET['id'], -10, 10);
	$info = getimagesize($SourceFile);
	$photo = imagecreatetruecolor(280, 220);
	//$pic = imagecreatefromjpeg($SourceFile);
	//imagecopy($photo, $pic, 0, 0, 0, 0, 280, 220);
	$logo = imagecreatefrompng("upload/menu.png");
	var_dump($logo);
	imagecopy($photo, $logo,  50, 50, 50, 50, 280, 220);

	header("Content-type: image/jpeg");
	imagejpeg($photo , $DestinationFile, 100);
	imagedestroy($photo);	
   // $WaterMarkText="www.infonhadat.net";
   // list($width, $height) = getimagesize($SourceFile);
   // $image_p = imagecreatetruecolor($width, $height);
   // $image = imagecreatefromjpeg($SourceFile);
   // imagecopyresampled($image_p, $image, 0, 0, 0, 0, $width, $height, $width, $height);
   // $black = imagecolorallocate($image_p, 255, 255, 255);
   // $font = 'arial.ttf';
   // $font_size = 20;
   // //150 left , 210 top
   // imagettftext($image_p, $font_size, 0, 20, 30, $black, $font, $WaterMarkText);
   // if ($DestinationFile<>'') {
      // imagejpeg ($image_p, $DestinationFile, 100);
   // } else {
      // header('Content-Type: image/jpg');
      // imagejpeg($image_p, null, 100);
   // };
   // imagedestroy($image);
   // imagedestroy($image_p);
	}
  function watermarkImageFull ($SourceFile,$DestinationFile) {
  	//$SourceFile = '/home/user/www/images/image1.jpg';
	//$DestinationFile = '/home/user/www/images/image1-watermark.jpg';
	//$WaterMarkText = 'Copyright phpJabbers.com';
   $WaterMarkText="www.infonhadat.net";
   list($width, $height) = getimagesize($SourceFile);
   $image_p = imagecreatetruecolor($width, $height);
   $image = imagecreatefromjpeg($SourceFile);
   imagecopyresampled($image_p, $image, 0, 0, 0, 0, $width, $height, $width, $height);
   $black = imagecolorallocate($image_p, 255, 255, 255);
   $font = 'arial.ttf';
   $font_size = 20;
   //150 left , 210 top
   imagettftext($image_p, $font_size, 0, 20, 30, $black, $font, $WaterMarkText);
   if ($DestinationFile<>'') {
      imagejpeg ($image_p, $DestinationFile, 100);
   } else {
      header('Content-Type: image/jpg');
      imagejpeg($image_p, null, 100);
   };
   imagedestroy($image);
   imagedestroy($image_p);
	}
  
  function watermarkImage ($SourceFile,$DestinationFile) {
  	//$SourceFile = '/home/user/www/images/image1.jpg';
	//$DestinationFile = '/home/user/www/images/image1-watermark.jpg';
	//$WaterMarkText = 'Copyright phpJabbers.com';
   $WaterMarkText="www.infonhadat.net";
   list($width, $height) = getimagesize($SourceFile);
   $image_p = imagecreatetruecolor($width, $height);
   $image = imagecreatefromjpeg($SourceFile);
   imagecopyresampled($image_p, $image, 0, 0, 0, 0, $width, $height, $width, $height);
   $black = imagecolorallocate($image_p, 255, 255, 255);
   $font = 'arial.ttf';
   $font_size = 10;
   //150 left , 210 top
   imagettftext($image_p, $font_size, 0, 150, 210, $black, $font, $WaterMarkText);
   if ($DestinationFile<>'') {
      imagejpeg ($image_p, $DestinationFile, 100);
   } else {
      header('Content-Type: image/jpg');
      imagejpeg($image_p, null, 100);
   };
   imagedestroy($image);
   imagedestroy($image_p);
	}
  function watermarkImage2 ($SourceFile,$DestinationFile) {
  	//$SourceFile = '/home/user/www/images/image1.jpg';
	//$DestinationFile = '/home/user/www/images/image1-watermark.jpg';
	//$WaterMarkText = 'Copyright phpJabbers.com';
   $WaterMarkText="www.infonhadat.net";
   list($width, $height) = getimagesize($SourceFile);
   $image_p = imagecreatetruecolor($width, $height);
   $image = imagecreatefromjpeg($SourceFile);
   imagecopyresampled($image_p, $image, 0, 0, 0, 0, $width, $height, $width, $height);
   $black = imagecolorallocate($image_p, 255, 255, 255);
   $font = 'arial.ttf';
   $font_size = 7;
   //150 left , 210 top
   imagettftext($image_p, $font_size, 0, 40, 105, $black, $font, $WaterMarkText);
   if ($DestinationFile<>'') {
      imagejpeg ($image_p, $DestinationFile, 100);
   } else {
      header('Content-Type: image/jpg');
      imagejpeg($image_p, null, 100);
   };
   imagedestroy($image);
   imagedestroy($image_p);
	}
  /**
   * Set Allow Max size
   * @param Int $maxSize (MB)
   */
  function setMaxSize($maxSize){
    $this->maxSize = $maxSize;
  }
  
  /**
   * @param String $fields
   * return mixed (True / Error msg)
   */
  function img_resize( $tmpname,$save_dir,$dir,$ah ='auto' ,$aw ='120' ) { 
    $save_dir .= ( substr($save_dir,-1) != "/") ? "/" : "";
    if (!file_exists($save_dir)) mkdir(str_replace('//','/',$save_dir), 0777, true);
    $gis = getimagesize($save_dir.$tmpname);
    $type = $gis[2];
    switch($type) {
    case "1": 
    $imorig = imagecreatefromgif($save_dir.$tmpname); 
    break;
    case "2": 
    $imorig = imagecreatefromjpeg($save_dir.$tmpname);
    break;
    case "3": 
    $imorig = imagecreatefrompng($save_dir.$tmpname);
    break;
    case "4": 
    $imorig = imagecreatefromjpg($save_dir.$tmpname);
    break;
    default: 
    $imorig = imagecreatefromjpeg($save_dir.$tmpname);
    }
    $x = imagesx($imorig);
    $y = imagesy($imorig);
    if($ah=='auto' && is_numeric($aw)){
    $ah=($aw/$x*100)*($y/100);
    }
    if($aw=='auto' && is_numeric($ah)){
    $aw=($ah/$y*100)*($x/100);
    }
    $im = imagecreatetruecolor($ah,$aw );
    if (imagecopyresampled($im,$imorig , 0,0,0,0,$aw,$ah,$x,$y)) {
      imagejpeg($im, $dir.$tmpname);
    }
    }
  function resize( $resizeLocation, $originalLocation, $scale = 0, $type = 'resizecrop',$width=290, $height=195) {
        //$width, $height: chiều rộng và cao của hình muốn resize
        //$resizeLocation, $originalLocation: đường dẫn của hình đã resize và đường dẫn ảnh gốc
        //$scale: độ co giãn của hình ảnh, 0 là giữ nguyên tỉ lệ hình ảnh
        //$type: kiểu resize(bác thử từng kiểu và xem kiểu nào phù hợp nhé )
        
            $output = strtolower(substr(basename($originalLocation), strrpos(basename($originalLocation), ".") + 1));
    
            $quality = 100;
            
            // -- get some information about the file
            $originalSize = getimagesize($originalLocation);
            $originalWidth  = $originalSize[0];
            $originalHeight = $originalSize[1];
                
            switch (strtolower($output)) {
                case 'gif': $srcImg = imagecreatefromgif($originalLocation); 
                    break;
                case 'jpg': $srcImg = imagecreatefromjpeg($originalLocation); 
                    break;
                case 'jpeg': $srcImg = imagecreatefromjpeg($originalLocation); 
                    break;
                case 'png': $srcImg = imagecreatefrompng($originalLocation); $quality = 9;
                    break;
            }
            
    
            if ($type == 'resizemin') {
                #figure out new dimensions
                
                
                $ratioX = $width / $originalWidth;
                $ratioY = $height / $originalHeight;
                    
                if($originalWidth<=$width && $originalHeight<=$height)
                {
                    $newX = $originalWidth;
                    $newY = $originalHeight;
                }
                else
                {

                    if (($originalWidth == $width) && ($originalHeight == $height)) {
                        $newX = $originalWidth;
                        $newY = $originalHeight;
                    } 
                    
                    elseif (($ratioY * $originalWidth) > $width) {
                        $newX = $width;
                        $newY = ceil($ratioX * $originalHeight);
                    } else {
                        $newX = ceil($ratioY * $originalWidth);        
                        $newY = $height;
                    }
                    
                }
                
                $tmpImage = imagecreatetruecolor($newX,$newY);
                imagecopyresampled($tmpImage, $srcImg, 0, 0, 0, 0, $newX, $newY, $originalWidth, $originalHeight);
    
                $dstImg = imagecreatetruecolor($width,$height);
                imagecopyresampled($dstImg, $tmpImage, 0, 0, 0, 0, $width, $height, $width, $height);
                imagedestroy($tmpImage);
    
            } else if ($type == 'resizecrop') {
    
                // -- resize to max, then crop to center
                $ratioX = $width / $originalWidth;
                $ratioY = $height / $originalHeight;
    
                if ($ratioX < $ratioY) { 
                    $newX = round(($originalWidth - ($width / $ratioY))/2);
                    $newY = 0;
                    $originalWidth = round($width / $ratioY);
                    $originalHeight = $originalHeight;
                } else { 
                    $newX = 0;
                    $newY = round(($originalHeight - ($height / $ratioX))/2);
                    $originalWidth = $originalWidth;
                    $originalHeight = round($height / $ratioX);
                }
    
                $dstImg = imagecreatetruecolor($width, $height);
                imagecopyresampled($dstImg, $srcImg, 0, 0, $newX, $newY, $width, $height, $originalWidth, $originalHeight);
    
            } else {
                
                $ratioX = $width / $originalWidth;
                $ratioY = $height / $originalHeight;
                if ($ratioX < $ratioY)
                    $scale = $ratioX;
                else
                    $scale = $ratioY;
    
                if ($scale > 0) {
                    $width = ceil($originalWidth*$scale);
                    $height = ceil($originalHeight*$scale);
                }
    
                # Maintains the aspect ration of the image and makes sure that it fits
                # within the maxW(newWidth) and maxH(newHeight) (thus some side will be smaller)
                $widthScale = 2;
                $heightScale = 2;  
                
                // Check to see that we are not over resizing, otherwise, set the new scale
                if($width) {
                    if($width > $originalWidth) $width = $originalWidth;
                    $widthScale =     $width / $originalWidth;
                }
    
                if( $height) {
                    if( $height > $originalHeight)  $height = $originalHeight;
                    $heightScale =  $height / $originalHeight;
                }
    
                if($widthScale < $heightScale) {
                    $maxWidth = $width;
                    $maxHeight = false;                            
                } elseif ($widthScale > $heightScale ) {
                    $maxHeight =  $height;
                    $maxWidth = false;
                } else {
                    $maxHeight =  $height;
                    $maxWidth = $width;
                }
                
                if($maxWidth > $maxHeight){
                    $applyWidth = $maxWidth;
                    $applyHeight = ($originalHeight*$applyWidth)/$originalWidth;
                } elseif ($maxHeight > $maxWidth) {
                    $applyHeight = $maxHeight;
                    $applyWidth = ($applyHeight*$originalWidth)/$originalHeight;
                } else {
                    $applyWidth = $maxWidth; 
                    $applyHeight = $maxHeight;
                }
    
                $dstImg = imagecreatetruecolor($applyWidth, $applyHeight);
                imagecopyresampled($dstImg, $srcImg, 0, 0 , 0, 0, $applyWidth, $applyHeight, $originalWidth, $originalHeight);
            }
            
            // -- try to write
            switch (strtolower($output)) {
                case 'jpg':
                    $write = imagejpeg($dstImg, $resizeLocation, $quality);
                    break;
                case 'jpeg':
                    $write = imagejpeg($dstImg, $resizeLocation, $quality);
                    break;
                case 'png':
                    $write = imagepng($dstImg, $resizeLocation, $quality);
                    break;
                case 'gif':
                    $write = imagegif($dstImg, $resizeLocation, $quality);
                    break;
            }
    
            chmod($resizeLocation, 0777);
            imagedestroy($dstImg);
    
        }
 function resizeslider( $resizeLocation, $originalLocation, $scale = 0, $type = 'resizecrop',$width=630, $height=300) {
        //$width, $height: chiều rộng và cao của hình muốn resize
        //$resizeLocation, $originalLocation: đường dẫn của hình đã resize và đường dẫn ảnh gốc
        //$scale: độ co giãn của hình ảnh, 0 là giữ nguyên tỉ lệ hình ảnh
        //$type: kiểu resize(bác thử từng kiểu và xem kiểu nào phù hợp nhé )
        
            $output = strtolower(substr(basename($originalLocation), strrpos(basename($originalLocation), ".") + 1));
    
            $quality = 100;
            
            // -- get some information about the file
            $originalSize = getimagesize($originalLocation);
            $originalWidth  = $originalSize[0];
            $originalHeight = $originalSize[1];
                
            switch (strtolower($output)) {
                case 'gif': $srcImg = imagecreatefromgif($originalLocation); 
                    break;
                case 'jpg': $srcImg = imagecreatefromjpeg($originalLocation); 
                    break;
                case 'jpeg': $srcImg = imagecreatefromjpeg($originalLocation); 
                    break;
                case 'png': $srcImg = imagecreatefrompng($originalLocation); $quality = 9;
                    break;
            }
            
    
            if ($type == 'resizemin') {
                #figure out new dimensions
                
                
                $ratioX = $width / $originalWidth;
                $ratioY = $height / $originalHeight;
                    
                if($originalWidth<=$width && $originalHeight<=$height)
                {
                    $newX = $originalWidth;
                    $newY = $originalHeight;
                }
                else
                {

                    if (($originalWidth == $width) && ($originalHeight == $height)) {
                        $newX = $originalWidth;
                        $newY = $originalHeight;
                    } 
                    
                    elseif (($ratioY * $originalWidth) > $width) {
                        $newX = $width;
                        $newY = ceil($ratioX * $originalHeight);
                    } else {
                        $newX = ceil($ratioY * $originalWidth);        
                        $newY = $height;
                    }
                    
                }
                
                $tmpImage = imagecreatetruecolor($newX,$newY);
                imagecopyresampled($tmpImage, $srcImg, 0, 0, 0, 0, $newX, $newY, $originalWidth, $originalHeight);
    
                $dstImg = imagecreatetruecolor($width,$height);
                imagecopyresampled($dstImg, $tmpImage, 0, 0, 0, 0, $width, $height, $width, $height);
                imagedestroy($tmpImage);
    
            } else if ($type == 'resizecrop') {
    
                // -- resize to max, then crop to center
                $ratioX = $width / $originalWidth;
                $ratioY = $height / $originalHeight;
    
                if ($ratioX < $ratioY) { 
                    $newX = round(($originalWidth - ($width / $ratioY))/2);
                    $newY = 0;
                    $originalWidth = round($width / $ratioY);
                    $originalHeight = $originalHeight;
                } else { 
                    $newX = 0;
                    $newY = round(($originalHeight - ($height / $ratioX))/2);
                    $originalWidth = $originalWidth;
                    $originalHeight = round($height / $ratioX);
                }
    
                $dstImg = imagecreatetruecolor($width, $height);
                imagecopyresampled($dstImg, $srcImg, 0, 0, $newX, $newY, $width, $height, $originalWidth, $originalHeight);
    
            } else {
                
                $ratioX = $width / $originalWidth;
                $ratioY = $height / $originalHeight;
                if ($ratioX < $ratioY)
                    $scale = $ratioX;
                else
                    $scale = $ratioY;
    
                if ($scale > 0) {
                    $width = ceil($originalWidth*$scale);
                    $height = ceil($originalHeight*$scale);
                }
    
                # Maintains the aspect ration of the image and makes sure that it fits
                # within the maxW(newWidth) and maxH(newHeight) (thus some side will be smaller)
                $widthScale = 2;
                $heightScale = 2;  
                
                // Check to see that we are not over resizing, otherwise, set the new scale
                if($width) {
                    if($width > $originalWidth) $width = $originalWidth;
                    $widthScale =     $width / $originalWidth;
                }
    
                if( $height) {
                    if( $height > $originalHeight)  $height = $originalHeight;
                    $heightScale =  $height / $originalHeight;
                }
    
                if($widthScale < $heightScale) {
                    $maxWidth = $width;
                    $maxHeight = false;                            
                } elseif ($widthScale > $heightScale ) {
                    $maxHeight =  $height;
                    $maxWidth = false;
                } else {
                    $maxHeight =  $height;
                    $maxWidth = $width;
                }
                
                if($maxWidth > $maxHeight){
                    $applyWidth = $maxWidth;
                    $applyHeight = ($originalHeight*$applyWidth)/$originalWidth;
                } elseif ($maxHeight > $maxWidth) {
                    $applyHeight = $maxHeight;
                    $applyWidth = ($applyHeight*$originalWidth)/$originalHeight;
                } else {
                    $applyWidth = $maxWidth; 
                    $applyHeight = $maxHeight;
                }
    
                $dstImg = imagecreatetruecolor($applyWidth, $applyHeight);
                imagecopyresampled($dstImg, $srcImg, 0, 0 , 0, 0, $applyWidth, $applyHeight, $originalWidth, $originalHeight);
            }
            
            // -- try to write
            switch (strtolower($output)) {
                case 'jpg':
                    $write = imagejpeg($dstImg, $resizeLocation, $quality);
                    break;
                case 'jpeg':
                    $write = imagejpeg($dstImg, $resizeLocation, $quality);
                    break;
                case 'png':
                    $write = imagepng($dstImg, $resizeLocation, $quality);
                    break;
                case 'gif':
                    $write = imagegif($dstImg, $resizeLocation, $quality);
                    break;
            }
    
            chmod($resizeLocation, 0777);
            imagedestroy($dstImg);
    
        }
  function resize_img( $resizeLocation, $originalLocation, $scale = 0, $type = 'resizecrop',$width=215, $height=150) {
        //$width, $height: chiều rộng và cao của hình muốn resize
        //$resizeLocation, $originalLocation: đường dẫn của hình đã resize và đường dẫn ảnh gốc
        //$scale: độ co giãn của hình ảnh, 0 là giữ nguyên tỉ lệ hình ảnh
        //$type: kiểu resize(bác thử từng kiểu và xem kiểu nào phù hợp nhé )
        
            $output = strtolower(substr(basename($originalLocation), strrpos(basename($originalLocation), ".") + 1));
    
            $quality = 100;
            
            // -- get some information about the file
            $originalSize = getimagesize($originalLocation);
            $originalWidth  = $originalSize[0];
            $originalHeight = $originalSize[1];
                
            switch (strtolower($output)) {
                case 'gif': $srcImg = imagecreatefromgif($originalLocation); 
                    break;
                case 'jpg': $srcImg = imagecreatefromjpeg($originalLocation); 
                    break;
                case 'jpeg': $srcImg = imagecreatefromjpeg($originalLocation); 
                    break;
                case 'png': $srcImg = imagecreatefrompng($originalLocation); $quality = 9;
                    break;
            }
            
    
            if ($type == 'resizemin') {
                #figure out new dimensions
                
                
                $ratioX = $width / $originalWidth;
                $ratioY = $height / $originalHeight;
                    
                if($originalWidth<=$width && $originalHeight<=$height)
                {
                    $newX = $originalWidth;
                    $newY = $originalHeight;
                }
                else
                {

                    if (($originalWidth == $width) && ($originalHeight == $height)) {
                        $newX = $originalWidth;
                        $newY = $originalHeight;
                    } 
                    
                    elseif (($ratioY * $originalWidth) > $width) {
                        $newX = $width;
                        $newY = ceil($ratioX * $originalHeight);
                    } else {
                        $newX = ceil($ratioY * $originalWidth);        
                        $newY = $height;
                    }
                    
                }
                
                $tmpImage = imagecreatetruecolor($newX,$newY);
                imagecopyresampled($tmpImage, $srcImg, 0, 0, 0, 0, $newX, $newY, $originalWidth, $originalHeight);
    
                $dstImg = imagecreatetruecolor($width,$height);
                imagecopyresampled($dstImg, $tmpImage, 0, 0, 0, 0, $width, $height, $width, $height);
                imagedestroy($tmpImage);
    
            } else if ($type == 'resizecrop') {
    
                // -- resize to max, then crop to center
                $ratioX = $width / $originalWidth;
                $ratioY = $height / $originalHeight;
    
                if ($ratioX < $ratioY) { 
                    $newX = round(($originalWidth - ($width / $ratioY))/2);
                    $newY = 0;
                    $originalWidth = round($width / $ratioY);
                    $originalHeight = $originalHeight;
                } else { 
                    $newX = 0;
                    $newY = round(($originalHeight - ($height / $ratioX))/2);
                    $originalWidth = $originalWidth;
                    $originalHeight = round($height / $ratioX);
                }
    
                $dstImg = imagecreatetruecolor($width, $height);
                imagecopyresampled($dstImg, $srcImg, 0, 0, $newX, $newY, $width, $height, $originalWidth, $originalHeight);
    
            } else {
                
                $ratioX = $width / $originalWidth;
                $ratioY = $height / $originalHeight;
                if ($ratioX < $ratioY)
                    $scale = $ratioX;
                else
                    $scale = $ratioY;
    
                if ($scale > 0) {
                    $width = ceil($originalWidth*$scale);
                    $height = ceil($originalHeight*$scale);
                }
    
                # Maintains the aspect ration of the image and makes sure that it fits
                # within the maxW(newWidth) and maxH(newHeight) (thus some side will be smaller)
                $widthScale = 2;
                $heightScale = 2;  
                
                // Check to see that we are not over resizing, otherwise, set the new scale
                if($width) {
                    if($width > $originalWidth) $width = $originalWidth;
                    $widthScale =     $width / $originalWidth;
                }
    
                if( $height) {
                    if( $height > $originalHeight)  $height = $originalHeight;
                    $heightScale =  $height / $originalHeight;
                }
    
                if($widthScale < $heightScale) {
                    $maxWidth = $width;
                    $maxHeight = false;                            
                } elseif ($widthScale > $heightScale ) {
                    $maxHeight =  $height;
                    $maxWidth = false;
                } else {
                    $maxHeight =  $height;
                    $maxWidth = $width;
                }
                
                if($maxWidth > $maxHeight){
                    $applyWidth = $maxWidth;
                    $applyHeight = ($originalHeight*$applyWidth)/$originalWidth;
                } elseif ($maxHeight > $maxWidth) {
                    $applyHeight = $maxHeight;
                    $applyWidth = ($applyHeight*$originalWidth)/$originalHeight;
                } else {
                    $applyWidth = $maxWidth; 
                    $applyHeight = $maxHeight;
                }
    
                $dstImg = imagecreatetruecolor($applyWidth, $applyHeight);
                imagecopyresampled($dstImg, $srcImg, 0, 0 , 0, 0, $applyWidth, $applyHeight, $originalWidth, $originalHeight);
            }
            
            // -- try to write
            switch (strtolower($output)) {
                case 'jpg':
                    $write = imagejpeg($dstImg, $resizeLocation, $quality);
                    break;
                case 'jpeg':
                    $write = imagejpeg($dstImg, $resizeLocation, $quality);
                    break;
                case 'png':
                    $write = imagepng($dstImg, $resizeLocation, $quality);
                    break;
                case 'gif':
                    $write = imagegif($dstImg, $resizeLocation, $quality);
                    break;
            }
    
            chmod($resizeLocation, 0777);
            imagedestroy($dstImg);
    
        } 
function resize_imgtp( $resizeLocation, $originalLocation, $scale = 0, $type = 'resizecrop',$width=260, $height=260) {
        //$width, $height: chiều rộng và cao của hình muốn resize
        //$resizeLocation, $originalLocation: đường dẫn của hình đã resize và đường dẫn ảnh gốc
        //$scale: độ co giãn của hình ảnh, 0 là giữ nguyên tỉ lệ hình ảnh
        //$type: kiểu resize(bác thử từng kiểu và xem kiểu nào phù hợp nhé )
        
            $output = strtolower(substr(basename($originalLocation), strrpos(basename($originalLocation), ".") + 1));
    
            $quality = 100;
            
            // -- get some information about the file
            $originalSize = getimagesize($originalLocation);
            $originalWidth  = $originalSize[0];
            $originalHeight = $originalSize[1];
                
            switch (strtolower($output)) {
                case 'gif': $srcImg = imagecreatefromgif($originalLocation); 
                    break;
                case 'jpg': $srcImg = imagecreatefromjpeg($originalLocation); 
                    break;
                case 'jpeg': $srcImg = imagecreatefromjpeg($originalLocation); 
                    break;
                case 'png': $srcImg = imagecreatefrompng($originalLocation); $quality = 9;
                    break;
            }
            
    
            if ($type == 'resizemin') {
                #figure out new dimensions
                
                
                $ratioX = $width / $originalWidth;
                $ratioY = $height / $originalHeight;
                    
                if($originalWidth<=$width && $originalHeight<=$height)
                {
                    $newX = $originalWidth;
                    $newY = $originalHeight;
                }
                else
                {

                    if (($originalWidth == $width) && ($originalHeight == $height)) {
                        $newX = $originalWidth;
                        $newY = $originalHeight;
                    } 
                    
                    elseif (($ratioY * $originalWidth) > $width) {
                        $newX = $width;
                        $newY = ceil($ratioX * $originalHeight);
                    } else {
                        $newX = ceil($ratioY * $originalWidth);        
                        $newY = $height;
                    }
                    
                }
                
                $tmpImage = imagecreatetruecolor($newX,$newY);
                imagecopyresampled($tmpImage, $srcImg, 0, 0, 0, 0, $newX, $newY, $originalWidth, $originalHeight);
    
                $dstImg = imagecreatetruecolor($width,$height);
                imagecopyresampled($dstImg, $tmpImage, 0, 0, 0, 0, $width, $height, $width, $height);
                imagedestroy($tmpImage);
    
            } else if ($type == 'resizecrop') {
    
                // -- resize to max, then crop to center
                $ratioX = $width / $originalWidth;
                $ratioY = $height / $originalHeight;
    
                if ($ratioX < $ratioY) { 
                    $newX = round(($originalWidth - ($width / $ratioY))/2);
                    $newY = 0;
                    $originalWidth = round($width / $ratioY);
                    $originalHeight = $originalHeight;
                } else { 
                    $newX = 0;
                    $newY = round(($originalHeight - ($height / $ratioX))/2);
                    $originalWidth = $originalWidth;
                    $originalHeight = round($height / $ratioX);
                }
    
                $dstImg = imagecreatetruecolor($width, $height);
                imagecopyresampled($dstImg, $srcImg, 0, 0, $newX, $newY, $width, $height, $originalWidth, $originalHeight);
    
            } else {
                
                $ratioX = $width / $originalWidth;
                $ratioY = $height / $originalHeight;
                if ($ratioX < $ratioY)
                    $scale = $ratioX;
                else
                    $scale = $ratioY;
    
                if ($scale > 0) {
                    $width = ceil($originalWidth*$scale);
                    $height = ceil($originalHeight*$scale);
                }
    
                # Maintains the aspect ration of the image and makes sure that it fits
                # within the maxW(newWidth) and maxH(newHeight) (thus some side will be smaller)
                $widthScale = 2;
                $heightScale = 2;  
                
                // Check to see that we are not over resizing, otherwise, set the new scale
                if($width) {
                    if($width > $originalWidth) $width = $originalWidth;
                    $widthScale =     $width / $originalWidth;
                }
    
                if( $height) {
                    if( $height > $originalHeight)  $height = $originalHeight;
                    $heightScale =  $height / $originalHeight;
                }
    
                if($widthScale < $heightScale) {
                    $maxWidth = $width;
                    $maxHeight = false;                            
                } elseif ($widthScale > $heightScale ) {
                    $maxHeight =  $height;
                    $maxWidth = false;
                } else {
                    $maxHeight =  $height;
                    $maxWidth = $width;
                }
                
                if($maxWidth > $maxHeight){
                    $applyWidth = $maxWidth;
                    $applyHeight = ($originalHeight*$applyWidth)/$originalWidth;
                } elseif ($maxHeight > $maxWidth) {
                    $applyHeight = $maxHeight;
                    $applyWidth = ($applyHeight*$originalWidth)/$originalHeight;
                } else {
                    $applyWidth = $maxWidth; 
                    $applyHeight = $maxHeight;
                }
    
                $dstImg = imagecreatetruecolor($applyWidth, $applyHeight);
                imagecopyresampled($dstImg, $srcImg, 0, 0 , 0, 0, $applyWidth, $applyHeight, $originalWidth, $originalHeight);
            }
            
            // -- try to write
            switch (strtolower($output)) {
                case 'jpg':
                    $write = imagejpeg($dstImg, $resizeLocation, $quality);
                    break;
                case 'jpeg':
                    $write = imagejpeg($dstImg, $resizeLocation, $quality);
                    break;
                case 'png':
                    $write = imagepng($dstImg, $resizeLocation, $quality);
                    break;
                case 'gif':
                    $write = imagegif($dstImg, $resizeLocation, $quality);
                    break;
            }
    
            chmod($resizeLocation, 0777);
            imagedestroy($dstImg);
    
        }     
  function upload($field, $targetDir,$thumbs){
    $bool = false;
    $dateprefix = date('YnjHis');  
    //if (!$this->isValidSize($_FILES[$field]['size'])) $this->err[] .= "Dung lượng file ảnh không được quá $this->maxSize MB!";
   // if (!$this->isValidExt(strtolower($_FILES[$field]['name']))) $this->err[] .= "Chỉ cho phép upload hình ảnh ".implode(",", $this->allowExt). "!";
      
    move_uploaded_file($field, $targetDir."/".$field);
      
      
      //if (!file_exists($thumbs)){
       //move_uploaded_file($_FILES[$field]['tmp_name'], $thumbs."/".$dateprefix."_".$_FILES[$field]['name']);
      //}
   
  }
  function upload2($date,$field, $targetDir,$thumbs){
    $bool = false;
    $dateprefix = date('YnjHis');  
    if (!$this->isValidSize($_FILES[$field]['size'])) $this->err[] .= "Dung lượng file ảnh không được quá $this->maxSize MB!";
    if (!$this->isValidExt(strtolower($_FILES[$field]['name']))) $this->err[] .= "Chỉ cho phép upload hình ảnh ".implode(",", $this->allowExt). "!";
    if ($this->err == null) {    
    move_uploaded_file($_FILES[$field]['tmp_name'], $targetDir."/".$date."_".$_FILES[$field]['name']);
      
      
      //if (!file_exists($thumbs)){
       //move_uploaded_file($_FILES[$field]['tmp_name'], $thumbs."/".$dateprefix."_".$_FILES[$field]['name']);
      //}
    }else $this->err[] .= "Lỗi: không upload được file!";   
           
    if ($this->err == null) return true;
    else {
      return implode("<br/>", $this->err);
    }
  }
  function upload3($date,$field, $targetDir,$thumbs){
    $bool = false;
    $dateprefix = date('YnjHis');  
    if (!$this->isValidSize($_FILES[$field]['size'])) $this->err[] .= "Dung lượng file ảnh không được quá $this->maxSize MB!";
    if (!$this->isValidExt(strtolower($_FILES[$field]['name']))) $this->err[] .= "Chỉ cho phép upload hình ảnh ".implode(",", $this->allowExt). "!";
    if ($this->err == null) {    
    move_uploaded_file($_FILES[$field]['tmp_name'], $targetDir."/".$date."_".$_FILES[$field]['name']);
      
      
      //if (!file_exists($thumbs)){
       //move_uploaded_file($_FILES[$field]['tmp_name'], $thumbs."/".$dateprefix."_".$_FILES[$field]['name']);
      //}
    }else $this->err[] .= "Lỗi: không upload được file!";   
           
    if ($this->err == null) return true;
    else {
      return implode("<br/>", $this->err);
    }
  }
  function upload4($date,$field, $targetDir,$thumbs){
    $bool = false;
    $dateprefix = date('YnjHis');  
    if (!$this->isValidSize($_FILES[$field]['size'])) $this->err[] .= "Dung lượng file ảnh không được quá $this->maxSize MB!";
    if (!$this->isValidExt(strtolower($_FILES[$field]['name']))) $this->err[] .= "Chỉ cho phép upload hình ảnh ".implode(",", $this->allowExt). "!";
    if ($this->err == null) {    
    move_uploaded_file($_FILES[$field]['tmp_name'], $targetDir."/".$date."_".$_FILES[$field]['name']);
      
      
      //if (!file_exists($thumbs)){
       //move_uploaded_file($_FILES[$field]['tmp_name'], $thumbs."/".$dateprefix."_".$_FILES[$field]['name']);
      //}
    }else $this->err[] .= "Lỗi: không upload được file!";   
           
    if ($this->err == null) return true;
    else {
      return implode("<br/>", $this->err);
    }
  }
  function upload5($date,$field, $targetDir,$thumbs){
    $bool = false;
    $dateprefix = date('YnjHis');  
    if (!$this->isValidSize($_FILES[$field]['size'])) $this->err[] .= "Dung lượng file ảnh không được quá $this->maxSize MB!";
    if (!$this->isValidExt(strtolower($_FILES[$field]['name']))) $this->err[] .= "Chỉ cho phép upload hình ảnh ".implode(",", $this->allowExt). "!";
    if ($this->err == null) {    
    move_uploaded_file($_FILES[$field]['tmp_name'], $targetDir."/".$date."_".$_FILES[$field]['name']);
      
      
      //if (!file_exists($thumbs)){
       //move_uploaded_file($_FILES[$field]['tmp_name'], $thumbs."/".$dateprefix."_".$_FILES[$field]['name']);
      //}
    }else $this->err[] .= "Lỗi: không upload được file!";   
           
    if ($this->err == null) return true;
    else {
      return implode("<br/>", $this->err);
    }
  }

  /**
   * @param String $filename
   * return T/F
   */
  private function isValidExt($filename){
    if (in_array(substr($filename, -4), $this->allowExt)) return true;
    return false;
  }
  
   /**
   * @param Int $size
   * return T/F
   */
  private function isValidSize($size){
    if($size <= ($this->maxSize*1024*1024)) return true;
    return false;
  }
  
}

?>