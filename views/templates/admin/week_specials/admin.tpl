<form method="POST" action="" class="defaultForm form-horizontal">
    <section id="sw_step_1" class="panel">
        <div class="panel-heading">
            <h2><i class="icon-chevron-right"></i><a href="#step_1" data-toggle="collapse">Step 1 : Setting the type of courses</a></h2>
        </div><!--panel-heading-->

        <div class="panel-body collapse-in" id="step_1">
            <label class="label control-label col-sm-3">Saisissez ici le type de plats</label>
            <div class="col-sm-9">
                {for $i=1 to $nb_dishes}
                <input type="text" name="courses[{$i}]" class="{$class}" /> {*TODO:CSS TAILLE INPUT width:inherit +*}
                {/for}
            </div>
        </div><!--panel-body-->

        <div class="panel-footer">
            <button class="btn btn-default pull-right" name="submit_weekspecial_courses" value="1" type="submit">
                <i class="process-icon-save"></i>Enregistrer
            </button>
        </div><!--panel-footer-->
    </section><!--panel-->
</form>

<form method="POST" action="" class="defaultForm form-horizontal">
    <div class="panel">

        <div class="panel-heading">
            <h2><i class="icon-calendar"></i>&nbsp;<a href="#sw_main_content" data-toggle="collapse">Saisissez ici les plats de la semaine</a></h2>
        </div>
    

        <div id="sw_main_content" class="panel-body collapse in">
            <div class="form-group">
                <label class="label control-label col-sm-3">Saisissez ici la date de votre choix</label>
                <div class="col-sm-9">
                    <input type="date" name="menu[date][]" />
                    <input type="date" name="menu[date][]" />
                </div>
            </div><!--form-group-->

            {foreach from=$days item=day}
            <h3><a href="#{$day}" data-toggle="collapse">{$day} <span class="icon-arrow-down"></span></a></h3>
            <div id="{$day}" class="form-group collapse {if $i eq 0}in{/if}">
                {for $i=1 to $nb_dishes}
                <div class="{$class}">
                    <label><span class="text-capitalize">{$course|replace:'_':' '}</span></label>
                    <textarea name="menu[{$day}][{$course}][name]"></textarea>
                    <label>Vegetarian dish</label>
                    <input type="checkbox" name="menu[{$day}][{$course}][vg]"  value="1"/>
                    <label>Porkfree dish</label>
                    <input type="checkbox" name="menu[{$day}][{$course}][pork]" value="1"  />
                    <select id="allergenes" name="menu[{$day}][{$course}][allergene][]" multiple>
                        {foreach from=$allergies item=allergene}
                            <option value="{$allergene}">{$allergene}</option>
                        {/foreach}
                    </select>
                </div>
                {/for}
            </div><!--form-group-->
            <br/>
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
