<?php

/*
*TODO: controller front 
*TODO: controller hooks //
*TODO: preview
*TODO: lien vers page formules
*TODO: controller admin
*TODO: Allergènes
*TODO: refonte tpl back
*FIXME: table vide à l'install
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
        
        if(!$this->registerHook('displayHomeTab')){
            return false;
        }
        
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
