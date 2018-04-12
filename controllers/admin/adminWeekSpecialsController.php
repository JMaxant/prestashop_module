<?php

class AdminWeekSpecialsController extends ModuleAdminController
{
    
    public function __construct()
    {
        $this->name='adminWeekSpecialsController';
        $this->context=Context::getContext();
        $this->table='weekspecials';
        $this->className='WeekSpecial';
        $this->bootstrap=true;
        $this->path=parent::getTemplatePath();
        parent::__construct();
    }

    public function initContent()
    {
        parent::initContent();
    }


}
