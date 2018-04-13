<?php

/*
*TODO: preview
*TODO: lien vers page formules
*TODO: controller admin
*FIXME: preview
*/
require_once(dirname(__FILE__).'/classes/WeekSpecial.php');


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

    // Install & uninstall tab

    public function installTab($parent, $class_name, $name)
    {
        $tab= new Tab();
        $tab->id_parent=(int)Tab::getIdFromClassName($parent);
        $tab->name=array();
        foreach(Language::getLanguages(true) as $lang){
            $tab->name[$lang['id_lang']]=$name;
        }
        $tab->class_name=$class_name;
        $tab->module=$this->name;
        $tab->active=1;
        return $tab->add();
    }

    public function uninstallTab($class_name)
    {
        $id_tab=(int)Tab::getIdFromClassName($class_name);
        $tab=new Tab((int)$id_tab);

        return $tab->delete();
    }


    // Install
    public function install()
    {
        if(!parent::install()){
            return false;
        }
        
        $sql_file=dirname(__FILE__).'/install/install.sql';
        if(!$this->loadSQLFile($sql_file)){
            return false;
        }

        if(!$this->installTab('AdminCatalog','AdminWeekSpecials','Week Specials')){
            return false;
        }
        
        if(!$this->registerHook('displayHomeTab')){
            return false;
        }
        
        $allergens=serialize(array('Gluten', 'Crustacés', 'Oeufs','Poisson','Arachides','Soja','Lait','Fruits à coque','Céleri','Moutarde','Sésame','Sulfites','Lupin','Mollusques'));
        Configuration::updateValue('WEEKS_DISHES','3');
        Configuration::updateValue('WEEKS_TEMPLATE','0');
        Configuration::updateValue('WEEKS_ALLERG',$allergens);
        return true;
    }
    
    // Uninstall
    public function uninstall()
    {
        if(!parent::uninstall()){
            return false;
        }
        $sql_file=dirname(__FILE__).'/install/uninstall.sql';
        if(!$this->loadSQLFile($sql_file)){
            return false;
        }

        if(!$this->uninstallTab('AdminWeekSpecials')){
            return false;
        }

        return true;
    }
    
    public function loadSQLFile($sql_file)
    {
        //get contents of the SQL File
        $sql_content=file_get_contents($sql_file);

        // Replaces PREFIX with proper PS db prefix, and stores the queries in an array
        $sql_content=str_replace('PREFIX', _DB_PREFIX_, $sql_content);
        $sql_queries=preg_split("/;\s*[\r\n]+/", $sql_content);

        $result=true;
        foreach($sql_queries as $queries) {
            if(!empty($queries)) {
                $result &= Db::getInstance()->execute(trim($queries));
            }
        }

        return $result;
    }

    // Displays Hooks via controllers
    public function getHookController($hook_name)
    {
        require_once(dirname(__FILE__).'/controllers/hook/'.$hook_name.'.php');
        $controller_name=$this->name.$hook_name.'Controller';
        $controller= new $controller_name($this, __FILE__,$this->path);
        return $controller;
    }


    // Front
    public function hookDisplayHomeTab($params)
    {
        $controller=$this->getHookController('displayHomeTab');
        return $controller->run($params);
    }

    // Back
    public function getContent($params)
    {
        $controller=$this->getHookController('getContent');
        return $controller->run($params);
    }
    
}

?>
