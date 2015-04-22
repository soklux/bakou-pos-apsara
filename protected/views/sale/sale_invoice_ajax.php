<?php $this->widget('yiiwheels.widgets.grid.WhGridView',array(
	'id'=>'sale-invoice-grid',
        'fixedHeader' => true,
        'responsiveTable' => true,
        'type'=>TbHtml::GRID_TYPE_BORDERED,
	'dataProvider'=>$model->saleInvoice($client_id,$search_text),
        //'summaryText' =>'', 
	'columns'=>array(
                array(
                    'class' => 'yiiwheels.widgets.grid.WhRelationalColumn',
                    'name' => 'sale_id',
                    'header'=>Yii::t('app','Invoice ID'),
                    'url' => $this->createUrl('SalePayment/PaymentDetail'),
                    'value' => '$data["sale_id"]',
                ),
                array('name'=>'status',
                      'header'=>Yii::t('app','Payment Status'),
                      //'value'=>'"<span class=\"label label- arrowed-right arrowed-in\"><s>" . $data["status"] . "</s></span>"',
                      'value'=>array($this,"gridPaymentStatus"),
                      'type'=>'raw'
                ),
                array('name'=>'sale_time',
                      'header'=>Yii::t('app','Invoice Date'),
                      'value'=>'$data["sale_time"]',
                ),
                array('name'=>'client_id',
                      'header'=>Yii::t('app','Customer Name'), 
                      'value'=>'$data["client_id"]',
                ),
                array('name'=>'amount',
                      'header'=>Yii::t('app','Amount'),   
                      'value' =>'number_format($data["amount"],Yii::app()->shoppingCart->getDecimalPlace(), ".", ",")',
                      'htmlOptions'=>array('style' => 'text-align: right;'),
                      'headerHtmlOptions'=>array('style' => 'text-align: right;'),
                ),
                array('name'=>'paid',
                      'header'=>Yii::t('app','Paid'),   
                      'value' =>'number_format($data["paid"],Yii::app()->shoppingCart->getDecimalPlace(), ".", ",")',
                      'htmlOptions'=>array('style' => 'text-align: right;'),
                      'headerHtmlOptions'=>array('style' => 'text-align: right;'),
                ),
                array('name'=>'date_paid',
                      'header'=>Yii::t('app','Date Paid'),
                      'value'=>array($this,"gridDatePaidColumn"),
                    ),
               array('name'=>'note',
                      'header'=>Yii::t('app','Note'),
                      'value'=>array($this,"gridNoteColumn"),
                    ),     
               array('name'=>'Payment',
                     'value'=>array($this,"gridPaymentBtn"),  
                     'type'=>'raw',
                ),       
                array('name'=>'balance',
                      'header'=>Yii::t('app','Balance'),   
                      'value' =>'$data["balance"]',
                      'htmlOptions'=>array('style' => 'text-align: right;'),
                      'headerHtmlOptions'=>array('style' => 'text-align: right;'),
                      'footer'=>$model->clientBalance($client_id), 
                      'footerHtmlOptions'=>array('style' => 'text-align: right;')
                ),
                /*
		array('class'=>'bootstrap.widgets.TbButtonColumn',
                      'header'=>Yii::t('app','Action'),
                      //'template'=>'{view}{print}',
                      'template'=>'{payment}',
                      //'htmlOptions'=>array('class'=>'hidden-phone visible-desktop btn-group'),  
                      'buttons' => array(
                          'payment' => array(
                            'click' => 'updateDialogOpen',
                            'label'=>Yii::t('app','Payment'),
                            'url'=>'Yii::app()->createUrl("SalePayment/create", array("sale_id"=>$data["sale_id"],"amount"=>$data["amount_to_paid"]))',
                            'options' => array(
                                'data-update-dialog-title' => Yii::t( 'app', 'Enter Payment' ),
                                'data-refresh-grid-id'=>'sale-invoice-grid',
                                'title'=>Yii::t('app','Payment Per Invoice'),
                                'class'=>'btn btn-small btn-info',
                              ), 
                          ),
                       ),
                 ),
                 * 
                 */
	),
)); ?>    