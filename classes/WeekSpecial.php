<?php

class WeekSpecial extends ObjectModel
{
    public $id_weekspecials_menu;
    public $courses_weekspecials_menu;
    public $array_weekspecials_menu;

    /*
    *@see ObjectModel::$definition
    */

    public static $definition=array(
        'table'=>'weekspecials',
        'primary'=>'id_weekspecials_menu',
        'multilang'=>true,
        'fields'=>array(
            'id_weekspecials_menu'=>array(
                'type'=>SELF::TYPE_INT,
                'validate'=>'isUnsignedInt',
            ),'courses_weekspecials_menu'=> array(
                'type'=>self::TYPE_STRING,
                'validate'=>'isString',
            ),'array_weekspecials_menu'=> array(
                'type'=>self::TYPE_STRING,
                'validate'=>'isString',
            )
        ),
    );

    public static function getAll()
    {
        $req=Db::getInstance()->getRow('
        SELECT * 
        FROM `'._DB_PREFIX_.'weekspecials` 
        ORDER BY `id_weekspecials_menu` DESC');

        return $req;
    }
}