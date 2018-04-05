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

    // Affichage hook front
        //Récupération des infos de formulaire
        public function processForms()
        {
            if(Tools::isSubmit('submit_weekspecials_content'))
            {
                $input=Tools::getAllValues();
                $menu=serialize($input['menu']);

                if(!Validate::isString($menu)){
                    $this->context->smarty->assign('error','error');
                }
                $WeekSpecial=new WeekSpecial();
                $WeekSpecial->array_weekspecials_menu=$menu;
                $WeekSpecial->add();
            }
            
        }

        // affichage hook displayHomeTab
    public function run()
    {   
        $req=WeekSpecial::getWeeksMenu();
        $output=unserialize($req['array_weekspecials_menu']);
        $args=array_keys($output);
        foreach($args as $arg){
            if($arg=='date'){
                $dates=$output[$arg];
                foreach($dates as $date){
                    $date=explode('-',$date);
                    $formatDates[]=$date[2].'/'.$date[1].'/'.$date[0];
                }
            }else{
                $menu[]=$output[$arg];
            }
        }
        $this->context->smarty->assign('dates',$formatDates);
        $this->context->smarty->assign('menu', $menu);
        $ws_days=array('Lundi','Mardi','Mercredi','Jeudi','Vendredi');
        $this->context->smarty->assign('ws_days',$ws_days);
        return $this->module->display($this->file, 'displayHomeTab.tpl');
    }
    
}
