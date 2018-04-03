<?php

/*
*TODO: controller front
*TODO: function dateformat
*TODO: Allergènes
*
*/
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
    // Affichage hook front
        //Récupération des infos de formulaire
        public function processForms()
        {
            if(Tools::isSubmit('submit_weekspecials_content'))
            {
                $input=Tools::getAllValues();
                $menu=serialize($input['menu']);
                Db::getInstance()->insert('weekspecials', array('array_weekspecials_menu' => pSQL($menu)));
            }
            
        }
        // affichage hook displayHomeTab
    public function hookDisplayHomeTab()
    {   
        $req=Db::getInstance()->getRow('SELECT `array_weekspecials_menu` FROM `'._DB_PREFIX_.'weekspecials` ORDER BY `id_weekspecials_menu` DESC');
        $menu=unserialize($req['array_weekspecials_menu']);

        // die;
        // $output=
        // $output=file_get_contents(__DIR__.'/export.json');
        // $output=json_decode($output, true);
        // $args=array_keys($output); // on récupère les clés du json converti en tableau, pour s'en servir en argument sur la boucle qui suit
        // foreach($args as $arg){
        //     if($arg=='date') // Pour l'attribution de la valeur date, il faut la formater au format francophone d'abord, puis l'attribuer à Smarty
        //     {
        //         $dates=$output[$arg];
        //         foreach($dates as $date){ 
        //             $date=explode('-',$date);
        //             $datesFormatees[]=$date[2].'/'.$date[1].'/'.$date[0];
        //         }
        //         $this->context->smarty->assign('dates',$datesFormatees);
        //     }  
        //     $this->context->smarty->assign($arg, $output[$arg]); //On attribue le reste des valeurs aux variables smarty dont le nom correspondra aux clés du formulaire weekspecials_content
        // }
        return $this->display(__FILE__, 'displayHomeTab.tpl');
    }

    // Page de config
        // Enregistrement des paramètres de configuration
    public function processConfiguration()
    {
        if(Tools::isSubmit('submit_weekspecials_config'))
        {
            $enable_front=Tools::getValue('enable_front');
            $enable_template=Tools::getValue('template');
            Configuration::updateValue('WEEKS_ENABLE', $enable_front);
            Configuration::updateValue('WEEKS_TEMPLATE', $enable_template);
            $this->context->smarty->assign('confirmation','true');
        }
    }

        // Submit template modifications && display .tpl content in textarea
    public function assignTemplate()
    {
        $path=_PS_MODULE_DIR_.'weekspecials/views/templates/hook/displayHomeTab.tpl';
        $tpl=file_get_contents($path);
        if(Tools::isSubmit('submit_weekspecials_template'))
        {
            $tpl=Tools::getValue('template');
            $file=fopen($path, 'w+');
            fwrite($file,$tpl);
            fclose($file);
        } 
        elseif(Tools::isSubmit('submit_weekspecials_reset'))
        {
            $tpl=file_get_contents(_PS_MODULE_DIR_.'weekspecials/displayHomeTab.bak.tpl');
            $file=fopen($path,'w+');
            fwrite($file, $tpl);
            fclose($file);            
        }
        $this->context->smarty->assign('tpl',$tpl);
    }

        // Affichage back
    public function getContent()
    {
        $this->processConfiguration();
        $this->processForms();
        $this->assignTemplate();
        $this->hookDisplayHomeTab();
        $path=_PS_MODULE_DIR_.'weekspecials/views/templates/hook/displayHomeTab.tpl';
        $this->context->smarty->assign('path',$path);
        $html_form=$this->renderForm();
        $this->context->smarty->assign('config',$html_form);
        $enable_template=Configuration::get('WEEKS_TEMPLATE');
        $this->context->smarty->assign('enable_template', $enable_template);

        return $this->display(__FILE__, 'getContent.tpl');
    }

        // handles back office configuration Form
    public function renderForm()
    {
        $fields_form=array(
            'form'=>array(
                'legend'=>array(
                    'title'=>$this->l('Weekly specials'),
                    'icon' =>'icon-envelope'
                ),
                'input'=>array(
                    array(
                        'type'=>'switch',
                        'label'=>$this->l('Enable Module'),
                        'name'=>'enable_front',
                        'desc'=>$this->l('Displays module in the front-office'),
                        'values'=>array(
                            array(
                                'id'=>'enable_1',
                                'value'=> 1,
                                'label'=>$this->l('Enabled')
                            ), array(
                                'id'=> 'enable_0',
                                'value'=>0,
                                'label'=>$this->l('Disabled')
                            )
                        ),
                    ), array(
                        'type'=>'switch',
                        'label'=>$this->l('Enable Template Editor'),
                        'name'=>'template',
                        'desc'=>$this->l('Enables edition of the template'),
                        'values'=>array(
                            array(
                                'id'=>'template_1',
                                'value'=>1,
                                'label'=>$this->l('Enabled')
                            ), array(
                                'id'=>'template_0',
                                'value'=>0,
                                'label'=>$this->l('Disabled')
                            )
                        )
                    ),
                ),
                'submit'=>array(
                    'title'=>$this->l('Save'),
                )
            ),
        );
        $helper=new HelperForm();
        $helper->table='weekspecials_config';
        $helper->default_form_language=(int)Configuration::get('PS_LANG_DEFAULT');
        $helper->allow_employee_form_lang=(int)Configuration::get('PS_BO_ALLOW_EMPLOYEE_FORM_LANG');
        $helper->submit_action='submit_weekspecials_config';
        $helper->currentIndex=$this->context->link->getAdminLink('AdminModules',false).'&configure='.$this->name.'&tab_module='.$this->tab.'$module_name='.$this->name;
        $helper->token=Tools::getAdminTokenLite('AdminModules');
        $helper->tpl_vars=array(
            'fields_value'=>array(
                'enable_front'=>Tools::getValue('enable_front', Configuration::get('WEEKS_ENABLE')),
                'template'=>Tools::getValue('template', Configuration::get('WEEKS_TEMPLATE')),
            ),
            'languages'=>$this->context->controller->getLanguages()
        );
        return $helper->generateForm(array($fields_form));
    }
}

?>
