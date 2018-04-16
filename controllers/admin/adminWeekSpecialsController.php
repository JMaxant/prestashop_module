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
        $this->setTemplate('admin.tpl');


        parent::__construct();
    }

    public function initContent()
    {
        
        parent::initContent();
        
        $nb_dishes=Configuration::get('WEEKS_DISHES');
        $allergs=unserialize(Configuration::get('WEEKS_ALLERG'));
        $days=array('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'); //FIXME:
        $class='col-sm-'.round(12/$nb_dishes); // allows to throw bootstrap classes depending on the number of dishes


        $this->context->smarty->assign('class',$class);
        $this->context->smarty->assign('nb_dishes',$nb_dishes);
        $this->context->smarty->assign('allergies',$allergs);
        $this->context->smarty->assign('days',$days);
        
    }
    
    public function postProcess()
    {
        if(Tools::isSubmit('submit_weekspecial_courses'))
        {
            $courses=Tools::getValue('courses');
            $courses=serialize($courses);
            // $WeekSpecial=new WeekSpecial();
            // $WeekSpecial->courses_weekspecials_menu=$courses;
            // $WeekSpecial->add();
        }
    }
    /**
     * @See Controller.php for more info on run() (basically handles all)
     */
    public function run()
    {
        parent::run();
    }
    
}
