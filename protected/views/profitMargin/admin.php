<?php
/* @var $this ProfitMarginController */
/* @var $model ProfitMargin */

$this->breadcrumbs=array(
	Yii::t('app','Profit Margin')=>array('admin'),
	Yii::t('app','Manage'),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#profit-margin-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<?php $box = $this->beginWidget('yiiwheels.widgets.box.WhBox', array(
              'title' => Yii::t('app','List of Profit Margin'),
              'headerIcon' => 'ace-icon fa fa-list',
              'htmlHeaderOptions'=>array('class'=>'widget-header-flat widget-header-small'),
)); ?>

<?php echo CHtml::link('Advanced Search','#',array('class'=>'search-button btn')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php if ( Yii::app()->user->checkAccess('item.create') ) { ?>

    <?php echo TbHtml::linkButton(Yii::t( 'app', 'Add New' ),array(
            'color'=>TbHtml::BUTTON_COLOR_PRIMARY,
            'size'=>TbHtml::BUTTON_SIZE_SMALL,
            'icon'=>'ace-icon fa fa-plus white',
            'url'=>$this->createUrl('create'),
    )); ?>

<?php } ?>

<?php if(Yii::app()->user->hasFlash('success')):?>
    <?php $this->widget('bootstrap.widgets.TbAlert'); ?>
<?php endif; ?>  

<?php $this->widget('yiiwheels.widgets.grid.WhGridView',array(
	'id'=>'profit-margin-grid',
	'dataProvider'=>$model->search(),
	'columns'=>array(
		'id',
		'name',
		'created_date',
		'modified_date',
		'modified_by',
		array(
			'class'=>'bootstrap.widgets.TbButtonColumn',
		),
	),
)); ?>

<?php $this->endWidget(); ?>