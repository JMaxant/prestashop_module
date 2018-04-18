<form method="POST" action="" class="defaultForm form-horizontal">
    <section id="sw_step_1" class="panel">

        <div class="panel-heading">
            <h2><i class="icon-chevron-right"></i><a href="#step_1" data-toggle="collapse">Step 1 : Setting the type of courses</a></h2>
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
            <h2><i class="icon-chevron-right"></i>&nbsp;<a href="#ws_date" data-toggle="collapse">Step 2 : Select the dates</a></h2>
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
            <h2><i class="icon-chevron-right"></i>&nbsp;<a href="#ws_main" data-toggle="collapse">Etape 3 : Saisissez le nom et les détails des plats</a></h2>
        </div><!--panel-heading-->

        <div id="ws_main" class="panel-body collapse">
            {foreach from=$days item=day name=day}
            <br/>
            <h3><a href="#{$day}" data-toggle="collapse">{$day} <span class="icon-arrow-down"></span></a></h3>
            <div id="{$day}" class="form-group collapse {if $smarty.foreach.day.first}in{/if}">
                {for $i=1 to $nb_dishes}
                <div class="{$class}">
                    <label><span class="text-capitalize">{$course[$i-1]}</span></label>
                    <textarea name="menu[{$day|lower}][{$course[$i-1]|lower}][name]"></textarea>
                    <label>Vegetarian dish</label>
                    <input type="checkbox" name="menu[{$day|lower}][{$course[$i-1]|lower}][vg]"  value="1"/>
                    <label>Porkfree dish</label>
                    <input type="checkbox" name="menu[{$day|lower}][{$course[$i-1]|lower}][pork]" value="1"  />
                    <select id="allergenes" name="menu[{$day|lower}][{$course[$i-1]|lower}][allergene][]" multiple>
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
    </div><!--panel-->
</form>

{debug}
