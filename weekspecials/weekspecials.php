<?php

class WeekSpecials extends Module
{
    // constructeur
    public function __construct()
    {
        $this->name='weekspecials';
        $this->tab='front_office_features';
        $this->version='0.1.0';
        $this->author='Julien Maxant & Sarah Gilbert';

        $this->displayName=$this->l('This Week\'s Specials');
        $this->description=$this->l('Allows displaying special dishes for the upcoming week');
        $this->bootstrap=true;

        parent::__construct();
    }

    //Install
    public function install()
    {
        parent::install();
        $this->registerHook('displayHomeTab');

        return true;
    }
    
    // Affichage hook front
        //Récupération des infos de formulaire
        public function processForms()
        {
            if(Tools::isSubmit('submit_weekspecials_content'))
            {
                $menu=Tools::getAllValues();
                $menu=array_splice($menu,0,6); //FIX ME
                $file=fopen(__DIR__.'/export.json','w+');
                fwrite($file, json_encode($menu));
                fclose($file);
            }
        }
        // affichage hook displayHomeTab
    public function hookDisplayHomeTab()
    {   
        $output=file_get_contents(__DIR__.'/export.json');
        $output=json_decode($output, true);
        $args=array_keys($output); // on récupère les clés du json converti en tableau, pour s'en servir en argument sur la boucle qui suit
        foreach($args as $arg){
            if($arg=='date') // Pour l'attribution de la valeur date, il faut la formater au format francophone d'abord, puis l'attribuer à Smarty;
            {
                $dates=$output[$arg];
                foreach($dates as $date){
                    $date=explode('-',$date);
                    $datesFormatees[]=$date[2].'/'.$date[1].'/'.$date[0];
                }
                $this->context->smarty->assign('dates',$datesFormatees);
            }  
            $this->context->smarty->assign($arg, $output[$arg]); //On attribue le reste des valeurs aux variables smarty dont le nom correspondra aux clés du formulaire weekspecials_content
        }
        return $this->display(__FILE__, 'displayHomeTab.tpl');
    }

    // Page de config
        // Enregistrement des paramètres de configuration
    public function processConfiguration()
    {
        if(Tools::isSubmit('submit_weekspecials_config'))
        {
            $enable_front=Tools::getValue('enable_front');
            $preview=Tools::getValue('preview');
            Configuration::updateValue('WEEKS_ENABLE', $enable_front);
            Configuration::updateValue('WEEKS_PREVIEW', $preview);
            $this->context->smarty->assign('confirmation','true');
        }
    }
        // Récupération des infos de configuration
    public function assignConfiguration()
    {
        $enable_front=Configuration::get('WEEKS_ENABLE');
        $preview=Configuration::get('WEEKS_PREVIEW');
        $this->context->smarty->assign('enable_front', $enable_front);
        $this->context->smarty->assign('preview', $preview);
    }
        // Affichage back
    public function getContent()
    {
        $this->processConfiguration();
        $this->processForms();
        $this->assignConfiguration();
        $this->hookDisplayHomeTab();
        $path=_PS_MODULE_DIR_.'weekspecials/views/templates/hook/displayHomeTab.tpl';
        var_dump($path);
        $this->context->smarty->assign('path',$path);
        return $this->display(__FILE__, 'getContent.tpl');
    }
}

?>