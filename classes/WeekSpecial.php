<?php

class WeekSpecial extends ObjectModel
{
    public $id_weekspecials_menu;
    public $array_weekspecials_menu;

    /*
    *@see ObjectModel::$definition
    */

    public static $definition=array(
        'table'=>'weekspecials',
        'primary'=>'id_weekspecials_menu',
        'multilang'=>true,
        'fields'=>array(
            'array_weekspecials_menu'=> array(
                'type'=>self::TYPE_STRING,
                'validate'=>'isString',
                'required'=>true,
            ),
        ),
    );

    public static function getWeeksMenu()
    {
        $req=Db::getInstance()->getRow('
        SELECT `array_weekspecials_menu` 
        FROM `'._DB_PREFIX_.'weekspecials` 
        ORDER BY `id_weekspecials_menu` DESC');
        return $req;
    }
}
