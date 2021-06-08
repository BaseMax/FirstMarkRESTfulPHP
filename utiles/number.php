<?php
!defined("MIRESEH") ? exit() : null;

function toFa($string) {
  $arabic = ['٩', '٨', '٧', '٦', '٥', '٤', '٣', '٢', '١', '٠'];
  $persian = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
  $persian = array_reverse($persian);
  $english = ['9', '8', '7', '6', '5', '4', '3', '2', '1', '0'];

  $converted = str_replace($arabic, $persian, $string);
  $converted = str_replace($english, $persian, $converted);
  return $converted;
}

function toEn($string) {
  $arabic = ['٩', '٨', '٧', '٦', '٥', '٤', '٣', '٢', '١', '٠'];
  $persian = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
  $persian = array_reverse($persian);
  $english = ['9', '8', '7', '6', '5', '4', '3', '2', '1', '0'];

  $converted = str_replace($persian, $english, $string);
  $converted = str_replace($arabic, $english, $converted);
  return $converted;
}
