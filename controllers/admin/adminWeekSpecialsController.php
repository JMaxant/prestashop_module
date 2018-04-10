<?php

class AdminWeekSpecialsController extends ModuleAdminController
{
    public function __construct()
    {
        $this->table='weekspecials';
        $this->className='WeekSpecial';

        $this->bootstrap=true;
        
        parent::__construct();
    }

    public function initContent()
    {
        parent::initContent();
    }
}
