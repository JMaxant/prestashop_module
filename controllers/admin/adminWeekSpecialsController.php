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
    public function setMedia()
    {
        parent::setMedia();

        $this->path=__PS_BASE_URI__.'modules/weekspecials/';

        // style and script for code mirror
        
        // $this->context->controller->addCSS($this->path.'views/js/codemirror/lib/codemirror.css','all');
        // $this->context->controller->addJS($this->path.'views/js/codemirror/lib/codemirror.js');
        // $this->context->controller->addJS($this->path.'views/js/codemirror/mode/css/css.js');
        // $this->context->controller->addJS($this->path.'views/js/codemirror/mode/smarty/smarty.js');

        $this->context->controller->addCSS($this->path.'views/css/styles.css','all');
        $this->context->controller->addJS($this->path.'views/js/app.js');

        
    }

    public function initContent()
    {
        parent::initContent();
        
        $tpl_edit=Configuration::get('WEEKS_TEMPLATE');
        $nb_dishes=Configuration::get('WEEKS_DISHES');
        $allergs=unserialize(Configuration::get('WEEKS_ALLERG'));
        $days=array('Monday','Tuesday','Wednesday','Thursday','Friday'); //FIXME:
        $class='col-sm-'.round(12/$nb_dishes); // allows to throw bootstrap classes depending on the number of dishes
        $path=_PS_MODULE_DIR_.'weekspecials/views/templates/hook/displayHomeTab.tpl';

        $this->context->smarty->assign('tpl_edit', $tpl_edit);
        $this->context->smarty->assign('path',$path);
        $this->context->smarty->assign('class',$class);
        $this->context->smarty->assign('nb_dishes',$nb_dishes);
        $this->context->smarty->assign('allergies',$allergs);
        $this->context->smarty->assign('days',$days);
        
    }
    
    public function postProcess()
    {
        if(Tools::isSubmit('submit_weekspecials_content'))
        {
            $input=Tools::getAllValues();
            foreach($input['courses'] as $course){
                $course=$this->module->stripAccents($course);
                $courses[]=$course;
            }
            $menu=$input['menu'];
            $menu=serialize($menu);
            $courses=serialize($courses);

            $WeekSpecial=new WeekSpecial();
            $WeekSpecial->courses_weekspecials_menu=$courses;
            $WeekSpecial->array_weekspecials_menu=$menu;
            $WeekSpecial->save();
            $this->previewTemplate();
        }
    }

         
    public function previewTemplate()
    {
        $controller=$this->module->getHookController('displayHomeTab');
        return $controller->assignTemplate();
    }

    // public function editTemplate()
    // {

    // }
    /**
     * @See Controller.php for more info on run() (basically handles everything if fed the right input)
     */
    public function run()
    {
        $this->previewTemplate();
        parent::run();
    }
    
}
