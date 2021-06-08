<?php
!defined("MIRESEH") ? exit() : null;

function format_price($str) {
  $str = number_format($str, 0, '.', '٫') . " تومان"; // Convert to Toman (A.K.A Rial)
  return $str;
}
