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

        $nb_dishes=Configuration::get('WEEKS_DISHES');
        $allergs=Configuration::get('WEEKS_ALLERG');
        $days=array('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday');

        $this->context->smarty->assign('nb_dishes',$nb_dishes);
        $this->context->smarty->assign('allergies',$allergs);
        $this->context->smarty->assign('days',$days);
            
    }


    public function initCourses()
    {
        if(isSubmit('submit_weekspecial_courses'))
        {
            $courses=Tools::getAllValues();
            var_dump($courses);
            die;
        }
    }
}
