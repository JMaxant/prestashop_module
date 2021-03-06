<?php

class WeekSpecialsGetContentController
{
    public function __construct($module, $file, $path)
    {
        $this->file=$file;
        $this->module=$module;
        $this->context=Context::getContext();
        $this->path=$path;
    }
    // Page de config
        // Enregistrement des paramètres de configuration
    public function processConfiguration()
    {
        if(Tools::isSubmit('submit_weekspecials_config'))
        {
            $allergens=unserialize(Configuration::get('WEEKS_ALLERG'));
            // $enable_template=Tools::getValue('template');
            $nb_dishes=Tools::getValue('dishes');
            $allergens[]=Tools::getValue('allergens');
            $allergens=serialize($allergens);
            // Configuration::updateValue('WEEKS_TEMPLATE', $enable_template);
            Configuration::updateValue('WEEKS_DISHES', $nb_dishes);
            Configuration::updateValue('WEEKS_ALLERG', $allergens);
            $this->context->smarty->assign('confirmation','true');
        }
    }
        
    public function resetConfiguration()
    {
        if(Tools::isSubmit('submit_weekspecial_default'))
        {
            $this->module->defaultConfiguration();
        }
    }

        // Affichage back
    public function run()
    { 
        $this->resetConfiguration();
        $this->processConfiguration();
        $html_form=$this->renderForm();
        $this->context->smarty->assign('config',$html_form);
        $enable_template=Configuration::get('WEEKS_TEMPLATE');
        $this->context->smarty->assign('enable_template', $enable_template);

        return $this->module->display($this->file, 'getContent.tpl');
    }

        // handles back office configuration Form
    public function renderForm()
    {
            // Récupération des allergènes pour affichage informatif
        $allergens=unserialize(Configuration::get('WEEKS_ALLERG'));
        $allergens=implode(' ',$allergens);

        $fields_form=array(
            'form'=>array(
                'legend'=>array(
                    'title'=>$this->module->l('Weekly specials configuration'),
                    'icon' =>'icon-wrench'
                ),
                'input'=>array(
                    // array(
                    //     'type'=>'switch',
                    //     'label'=>$this->module->l('Enable Template Editor'),
                    //     'name'=>'template',
                    //     'desc'=>$this->module->l('Enables edition of the template'),
                    //     'values'=>array(
                    //         array(
                    //             'id'=>'template_1',
                    //             'value'=>1,
                    //             'label'=>$this->module->l('Enabled'),
                    //         ), array(
                    //             'id'=>'template_0',
                    //             'value'=>0,
                    //             'label'=>$this->module->l('Disabled'),
                    //         )
                    //     ),
                    // ), 
                    array(
                        'type'=>'select',
                        'label'=>$this->module->l('Select the number of courses'),
                        'name'=>'dishes',
                        'desc'=>$this->module->l('Allows you to select the number of dishes per day (their name are set in the admin page)'),
                        'options'=>array(
                            'query'=>array('1','2','3','4','5'),
                            'id'=>'nb_dishes',
                        ),
                    ), array(
                        'type'=>'text',
                        'label'=>$this->module->l('Set allergens'),
                        'name'=>'allergens',
                        'desc'=>$this->module->l('Sets allergens (current allergens are '.$allergens.')'),
                    )
                ),
                'submit'=>array(
                    'title'=>$this->module->l('Save'),
                )
            ),
        );

        $helper=new HelperForm();
        $helper->table='weekspecials_config';
        $helper->default_form_language=(int)Configuration::get('PS_LANG_DEFAULT');
        $helper->allow_employee_form_lang=(int)Configuration::get('PS_BO_ALLOW_EMPLOYEE_FORM_LANG');
        $helper->submit_action='submit_weekspecials_config';
        $helper->currentIndex=$this->context->link->getAdminLink('AdminModules',false).'&configure='.$this->module->name.'&tab_module='.$this->module->tab.'&module_name='.$this->module->name;
        $helper->token=Tools::getAdminTokenLite('AdminModules');
        $helper->tpl_vars=array(
            'fields_value'=>array(
                'enable_front'=>Tools::getValue('enable_front', Configuration::get('WEEKS_ENABLE')),
                'template'=>Tools::getValue('template', Configuration::get('WEEKS_TEMPLATE')),
                'dishes'=> Tools::getValue('dishes', Configuration::get('WEEKS_DISHES')),
            ),
            'languages'=>$this->context->controller->getLanguages()
        );
        return $helper->generateForm(array($fields_form));
    }

}