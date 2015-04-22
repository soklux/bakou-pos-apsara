<?php $this->widget('EExcelView',array(
        'id'=>'invoice-grid',
        'fixedHeader' => true,
        //'responsiveTable' => true,
        'type'=>'striped bordered hover',
        'template'=>"{summary}\n{items}\n{exportbuttons}\n{pager}",
        'dataProvider'=>$model->invoice($client_id),
        'summaryText' =>'<p class="text-info"> Invoice Detail </p>', 
        'htmlOptions'=>array('class'=>'table-responsive panel'),
        'columns'=>array(
                array('name'=>'id',
                      'header'=>Yii::t('app','Invoice ID'),
                      'type'=>'raw',
                      'value'=>'$data["sale_id"]',  
                ),
                array('name'=>'client_name',
                      'header'=>Yii::t('app','Customer Name'), 
                      'value'=>'$data["client_name"]',
                ),
                array('name'=>'sale_time',
                      'header'=>Yii::t('app','Sale Time'),
                      'value'=>'$data["sale_time"]',
                      //'value'=>'CHtml::link($data["sale_time"], Yii::app()->createUrl("saleitem/admin",array("id"=>$data["id"])))',
                      //'type'=>'raw',
                ),
                array('name'=>'sub_total',
                      'header'=>Yii::t('app','Sub Total'),   
                      'headerHtmlOptions'=>array('style' => 'text-align: right;'),
                      'value' =>'number_format($data["sub_total"],Yii::app()->shoppingCart->getDecimalPlace(), ".", ",")',
                      'htmlOptions'=>array('style' => 'text-align: right;'),
                ),
                array('name'=>'discount_amount',
                      'header'=>Yii::t('app','Discount'),   
                      'headerHtmlOptions'=>array('style' => 'text-align: right;'),
                      'value' =>'number_format($data["discount_amount"],Yii::app()->shoppingCart->getDecimalPlace(), ".", ",")',
                      'htmlOptions'=>array('style' => 'text-align: right;'),
                ),
                array('name'=>'paid',
                      'header'=>Yii::t('app','Paid'),   
                      'headerHtmlOptions'=>array('style' => 'text-align: right;'),
                      'value' =>'number_format($data["paid"],Yii::app()->shoppingCart->getDecimalPlace(), ".", ",")',
                      'htmlOptions'=>array('style' => 'text-align: right;'),
                ),
                array('name'=>'balance',
                      'header'=>Yii::t('app','Balance'),   
                      'headerHtmlOptions'=>array('style' => 'text-align: right;'),
                      'value' =>'number_format($data["balance"],Yii::app()->shoppingCart->getDecimalPlace(), ".", ",")',
                      'htmlOptions'=>array('style' => 'text-align: right;'),
                      'footer'=> number_format($balance,Yii::app()->shoppingCart->getDecimalPlace(),'.', ','),
                      'footerHtmlOptions'=>array('style' => 'text-align: right;'),
                ),
        ),
)); ?>   