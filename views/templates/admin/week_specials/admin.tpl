<form method="POST" action="" class="defaultForm form-horizontal">

    <section id="ws_back-office" class="panel">

        <div class="panel-heading">
            <h3><i class="icon-chevron-right"></i><a href="#ws_step_1" data-toggle="collapse">Etape 1 : Saisissez le type de plats</a></h3>
        </div><!--panel-heading-->

        <div class="panel-body collapse in" id="ws_step_1">
            <label class="label control-label col-sm-3">Saisissez ici le type de plats</label>
            <div class="col-sm-9">
                {for $i=1 to $nb_dishes}
                <input data-attribute="courses_{$i}" type="text" name="courses[{$i}]" class="{$class} ws_input_dishes" />
                {/for}
            </div>
        </div><!--panel-body-->

        <div class="panel-heading">
            <h3><i class="icon-chevron-right"></i>&nbsp;<a href="#ws_step_2" data-toggle="collapse">Etape 2 : sélectionnez les dates</a></h3>
        </div><!--panel-heading-->

        <div id="ws_step_2" class="panel-body collapse">
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
            <h3><i class="icon-chevron-right"></i>&nbsp;<a href="#ws_step_3" data-toggle="collapse">Etape 3 : Saisissez le nom et les détails des plats</a></h3>
        </div><!--panel-heading-->
        <div id="ws_step_3" class="panel-body collapse">
            {foreach from=$ws_days item=day name=day}
            <br/>
            <h3><a href="#{$day}" data-toggle="collapse">{$day} <span class="icon-arrow-down"></span></a></h3>
            <div id="{$day}" class="form-group collapse {if $smarty.foreach.day.first}in{/if}">
                {for $i=1 to $nb_dishes}
                <div class="{$class}">
                    <label class="courses_{$i}"></label>
                    <textarea name="menu[{$day|lower}][{$i}][name]"></textarea>
                    <label>Vegetarian dish</label>
                    <input type="checkbox" name="menu[{$day|lower}][{$i}][vg]"  value="1"/>
                    <label>Porkfree dish</label>
                    <input type="checkbox" name="menu[{$day|lower}][{$i}][pork]" value="1"  />
                    <select class="allergenes" name="menu[{$day|lower}][{$i}][allergene][]" multiple>
                        {foreach from=$allergs item=allerg}
                            <option value="{$allerg}">{$allerg}</option>
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
    <div class="panel-heading">
        <h3><i class="icon-desktop"></i>&nbsp;Prévisualisation en direct</h3>
    </div>
    {* <div class="alert alert-info">
        <p>Attention : le résultat de la prévisualisation ne sera visible qu'aprés avoir envoyé le formulaire ci-dessus.</p>
        <p>Des différences mineures, notamment sur les polices et leurs tailles, peuvent apparaitre entre la prévisualisation et le rendu sur la page d'accueil : c'est à cause du style chargé dans le back-office</p>
    </div> *}
    <div id="preview" class="panel-body">
        {include file="$path"}
    </div>
</section>