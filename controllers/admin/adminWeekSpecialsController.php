<?php

class AdminWeekSpecialsController extends ModuleAdminController
{
    
    public function __construct()
    {
        $this->name='adminWeekSpecialsController';
        $this->table='weekspecials';
        $this->className='WeekSpecial';
        $this->bootstrap=true;

        parent::__construct();
    }

    public function initContent()
    {
        parent::initContent();
        // $enable=Configuration::get('WEEKS_ENABLE');
        // var_dump($enable);
        $html='test';
        $this->context->smarty->assign('content',$html);
    }

    
    // public function initContent()
    // {
    //     parent::initContent();
    //     $content=$this->context->smarty->fetch(_PS_MODULE_DIR.'weekspecials/views/template/admin/content.tpl');
    //     var_dump($content);
    //     die;
        
    //     // $this->context->smarty->assign(array(
    //     //     'content'=>$this->content.$content,
    //     //     )
    //     // );
    // }

}
