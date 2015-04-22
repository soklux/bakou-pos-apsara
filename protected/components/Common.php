<?php
Class Common 
{
    public static function Discount($discount) {
        if (substr($discount, 0, 1) == '$') {
            $discount_amount = substr($discount, 1);
            $discount_type = '$';
        } else {
            $discount_amount = $discount;
            $discount_type = '%';
        }
        
        return array($discount_amount, $discount_type);
    }
    
    public static function calDiscount($discount,$price,$quantity) {
        if (substr($discount, 0, 1) == '$') {
            $total=round($price * $quantity - substr($discount, 1), Yii::app()->shoppingCart->getDecimalPlace(), PHP_ROUND_HALF_DOWN);
        } else {
            $total=round($price * $quantity - $price * $quantity * $discount / 100, Yii::app()->shoppingCart->getDecimalPlace(), PHP_ROUND_HALF_DOWN);
        }
        return $total;
    }
    
}