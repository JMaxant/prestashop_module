<form method="POST" action="" class="defaultForm form-horizontal">
    <section id="ws_step_1" class="panel">

        <div class="panel-heading">
            <h3><i class="icon-chevron-right"></i><a href="#step_1" data-toggle="collapse">Step 1 : Setting the type of courses</a></h3>
        </div><!--panel-heading-->

        <div class="panel-body collapse in" id="step_1">
            <label class="label control-label col-sm-3">Saisissez ici le type de plats</label>
            <div class="col-sm-9">
                {for $i=1 to $nb_dishes}
                <input type="text" name="courses[{$i}]" class="{$class}" /> {*TODO:CSS TAILLE INPUT width:inherit +*}
                {/for}
            </div>
        </div><!--panel-body-->
        <br/>
    
        <div class="panel-heading">
            <h3><i class="icon-chevron-right"></i>&nbsp;<a href="#ws_date" data-toggle="collapse">Step 2 : Select the dates</a></h3>
        </div><!--panel-heading-->

        <div id="ws_date" class="panel-body collapse" >
            <div class="form-group">
                <label class="label control-label col-sm-3">Saisissez ici la date de votre choix</label>
                <div class="col-sm-9">
                    <input type="date" name="menu[date][]" />
                    <input type="date" name="menu[date][]" />
                </div>
            </div><!--form-group-->
        </div>
        <br/>
        <div class="panel-heading">
            <h3><i class="icon-chevron-right"></i>&nbsp;<a href="#ws_main" data-toggle="collapse">Etape 3 : Saisissez le nom et les détails des plats</a></h3>
        </div><!--panel-heading-->

        <div id="ws_main" class="panel-body collapse">
            {foreach from=$days item=day name=day}
            <br/>
            <h3><a href="#{$day}" data-toggle="collapse">{$day} <span class="icon-arrow-down"></span></a></h3>
            <div id="{$day}" class="form-group collapse {if $smarty.foreach.day.first}in{/if}">
                {for $i=1 to $nb_dishes}
                <div class="{$class}">
                    <label><span class="text-capitalize">WIP</span></label>
                    <textarea name="menu[{$day|lower}][{$i}][name]"></textarea>
                    <label>Vegetarian dish</label>
                    <input type="checkbox" name="menu[{$day|lower}][{$i}][vg]"  value="1"/>
                    <label>Porkfree dish</label>
                    <input type="checkbox" name="menu[{$day|lower}][{$i}][pork]" value="1"  />
                    <select id="allergenes" name="menu[{$day|lower}][{$i}][allergene][]" multiple>
                        {foreach from=$allergies item=allergene}
                            <option value="{$allergene}">{$allergene}</option>
                        {/foreach}
                    </select>
                </div>
                {/for}
            </div><!--form-group-->
            {/foreach}
        </div><!--#sw_main_content-->
        <div class="panel-footer">
            <button class="btn btn-default pull-right" name="submit_weekspecials_content" value="1" type="submit">
                <i class="process-icon-save"></i>Enregistrer
            </button>
        </div> <!--panel-footer-->
    </section><!--panel-->
</form>
{*Preview*}

<section class="panel">
    <div class="panel-header">
        <h3><i class="icon-desktop"></i>&nbsp;Prévisualisation en direct</h3>
    </div>
    
    <div class="panel-body back_back">

        <h3 style="background:#C6AEA4;padding:20px 0;color:#fff!important;margin:auto!important;">QU'EST-CE QU'ON MANGE CETTE SEMAINE ?</h3>

        <table class="table-bordered table_previ">
            <thead>
                <tr>
                    <th class="semaine"></th>
                    <th class="table_back"><span style="font-size:24px;color:#C49D42;">ENTRÉE</span></th>
                    <th class="tablee_back"><span style="font-size:24px;color:#C49D42;">SALADE</span></th>
                    <th class="tablee_back"><span style="font-size:24px;color:#C49D42;">PLAT</span></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                <th scope="row">Lundi</th>
                    <td class="table_back"><p id="visuel_entree_lundi"> </p></td>
                    <td class="table_back"><span id="visuel_salade_lundi"></span></td>
                    <td class="table_back"><span id="visuel_plat_lundi"></span></td>
                </tr>
                <tr>
                <th scope="row">Mardi</th>
                    <td class="table_back"><p id="visuel_entree_mardi"></p></td>
                    <td class="table_back"><span id="visuel_salade_mardi"></span></td>
                    <td class="table_back"><span id="visuel_plat_mardi"></span></td>
                </tr>
                <tr>
                <th scope="row">Mercredi</th>
                    <td class="table_back"><p id="visuel_entree_mercredi"></p></td>
                    <td class="table_back"><span id="visuel_salade_mercredi"></span></td>
                    <td class="table_back"><span id="visuel_plat_mercredi"></span></td>
                </tr>
                <tr>
                <th scope="row">Jeudi</th>
                    <td class="table_back"><p id="visuel_entree_jeudi"></p></td>
                    <td class="table_back"><span id="visuel_salade_jeudi"></span></td>
                    <td class="table_back"><span id="visuel_plat_jeudi"></span></td>
                </tr>
                <tr>
                <th scope="row">Vendredi</th>
                    <td class="table_back"><p id="visuel_entree_vendredi"></p></td>
                    <td class="table_back"><span id="visuel_salade_vendredi"></span></td>
                    <td class="table_back"><span id="visuel_plat_vendredi"></span></td>
                </tr>
            </tbody>
        </table>
    </div>
</section>

{debug}
