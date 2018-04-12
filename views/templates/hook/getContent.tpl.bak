{* Affichage confirmation de soumission formulaires *}
{if isset($confirmation)}
<div class="alert alert-success">
    <p>La configuration a bien été sauvegardée.</p>
</div>
{/if}

{* CONFIGURATION FORM *}
{$config}
{* /CONFIGURATION FORM *}

{* Formulaire affichage front *}
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
            </div>
            {capture}{assign "i" 0}{/capture}
            {foreach from=$days item=day}
            <h3><a href="#{$day}" data-toggle="collapse">{$day} <span class="icon-arrow-down"></span></a></h3>
            <div id="{$day}" class="form-group collapse {if $i eq 0}in{/if}">
                {foreach from=$courses item=course}
                <div class="col-sm-4">
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
                {/foreach}
            </div>
            {capture}{$i++}{/capture}
            {/foreach}
                  
        </div><!--form-wrapper-->
        <div class="panel-footer">
            <button class="btn btn-default pull-right" name="submit_weekspecials_content" value="1" type="submit">
                <i class="process-icon-save"></i>Enregistrer
            </button>
        </div> 
    </div><!--panel-->
</form>

{* Affichage preview *}
    <section class="panel">
            <div class="panel-heading">
                <h2><i class="icon-cogs"></i><a href="#sw_content_preview" data-toggle="collapse">&nbsp;Preview<span class="icon-arrow-down"></span></a></h2>
            </div>
            
            <div id="sw_content_preview" class="panel-body collapse in">
                {include file=$path}
            </div>

            <div class="panel-footer">
            </div>
    </section>

{* Espace de customisation template hook front *}
{if $enable_template eq 1}
    <section class="panel">
        <form method="POST" action="" class="defaultForm form-horizontal">
            <div class="panel-heading">
                <h2><i class="icon-cogs"></i><a href="#sw_content_tpl" data-toggle="collapse">&nbsp;template<span class="icon-arrow-down"></span></a></h2>
            </div>

            <div id="sw_content_tpl" class="panel-body collapse in">
                <textarea id="template" name="template" value="">
                    {$tpl}
                </textarea>
            </div>

            <div class="panel-footer">
                <button class="btn btn-default pull-right" name="submit_weekspecials_template" value="1" type="submit">
                    <i class="process-icon-save"></i>Enregistrer
                </button>
                <button class="btn btn-default pull-right" name="submit_weekspecials_reset" value="1" type="submit">
                    <i class="process-icon-refresh"></i>Remettre par défaut
                </button>
            </div>
        </form>
    </section>
{/if}
