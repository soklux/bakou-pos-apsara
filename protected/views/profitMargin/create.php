<?php
/* @var $this ProfitMarginController */
/* @var $model ProfitMargin */
?>

<?php
$this->breadcrumbs=array(
	Yii::t('app','Profit Margin')=>array('admin'),
	Yii::t('app','Create'),
);

?>

<?php if(Yii::app()->user->hasFlash('warning')):?>
    <?php $this->widget('bootstrap.widgets.TbAlert'); ?>
<?php endif; ?> 

<?php $box = $this->beginWidget('yiiwheels.widgets.box.WhBox', array(
              'title' => Yii::t('app','Create Profit Margin'),
              'headerIcon' => 'ace-icon fa fa-tags',
              'htmlHeaderOptions'=>array('class'=>'widget-header-flat widget-header-small'),
              'content' => $this->renderPartial('_form', array('model'=>$model,'price_tiers'=>$price_tiers), true),
 )); ?>  

<?php $this->endWidget(); ?>