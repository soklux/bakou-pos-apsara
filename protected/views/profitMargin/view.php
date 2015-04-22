<?php
/* @var $this ProfitMarginController */
/* @var $model ProfitMargin */
?>

<?php
$this->breadcrumbs=array(
	'Profit Margins'=>array('index'),
	$model->name,
);

$this->menu=array(
	array('label'=>'List ProfitMargin', 'url'=>array('index')),
	array('label'=>'Create ProfitMargin', 'url'=>array('create')),
	array('label'=>'Update ProfitMargin', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete ProfitMargin', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage ProfitMargin', 'url'=>array('admin')),
);
?>

<h1>View ProfitMargin #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView',array(
    'htmlOptions' => array(
        'class' => 'table table-striped table-condensed table-hover',
    ),
    'data'=>$model,
    'attributes'=>array(
		'id',
		'name',
		'create_date',
		'updated_date',
		'created_by',
		'updated_by',
	),
)); ?>