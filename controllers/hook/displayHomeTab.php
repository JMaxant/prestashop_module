<?php

class WeekSpecialsDisplayHomeTabController
{
    public function __construct($module, $file, $path)
    {
        $this->file=$file;
        $this->module=$module;
        $this->context=Context::getContext();
        $this->path=$path;
    }

    public function setMedia()
    {
        $this->path=__PS_BASE_URI__.'modules/weekspecials/';
        $this->context->controller->addCSS($this->path.'views/css/styles.css','all');
        $this->context->controller->addJS($this->path.'views/js/app.js');
    }    
    // affichage hook displayHomeTab
    public function assignTemplate()
    {
        $req=WeekSpecial::getAll();
        $courses=unserialize($req['courses_weekspecials_menu']);
        $output=unserialize($req['array_weekspecials_menu']);
        $args=array_keys($output);;
        foreach($args as $arg){
            if($arg=='date'){
                $dates=$output[$arg];
                // var_dump($dates);
                // die;
                if(!empty($dates[0])&&!empty($dates[1])){
                    foreach($dates as $date){
                        $date=explode('-',$date);
                        $formatDates[]=$date[2].'/'.$date[1].'/'.$date[0];
                    }
                }
            }else{
                $menu[]=$output[$arg];
            }
        }
        $this->context->smarty->assign('dates',$formatDates);
        $this->context->smarty->assign('menu', $menu);
        $this->context->smarty->assign('courses',$courses);
        $ws_days=$this->module->days;
        $this->context->smarty->assign('ws_days',$ws_days);
    }
    public function run()
    {   
       
        $this->setMedia();
        $this->assignTemplate();

        return $this->module->display($this->file, 'displayHomeTab.tpl');
    }
    
}
