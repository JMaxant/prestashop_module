
{* Affichage confirmation de soumission formulaires *}
{if isset($confirmation)}
<div class="alert alert-success">
    <p>La configuration a bien été sauvegardée.</p>
</div>
{/if}
{*Formulaire configuration*}
<form method="POST" action="" class="defaultForm form-horizontal">
    <div class="panel">

        <div class="panel-heading">
            <h2><i class="icon-cogs"></i>&nbsp;Espace de configuration Menu de la Semaine</h2>
        </div> 

        <div class="form-wrapper">
            <div class="form-group">
                <label class="control-label col-sm-3">Activer/Désactiver l'affichage du menu</label>
                <div class="col-sm-9">
                    <img src="../img/admin/enabled.gif" alt="" />
                    <input type="radio" id="enable_1" name="enable_front" value="1"{if $enable_front eq 1} checked{/if} />
                    <label for="enable_1">Activer</label>
                    <img src="../img/admin/disabled.gif" alt="" />
                    <input type="radio" id="enable_0" name="enable_front" value="0"{if $enable_front ne 1} checked{/if} />
                    <label for="enable_0">Désactiver</label>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3">Modification du template d'affichage</label>
                <div class="col-sm-9">
                    <img src="../img/admin/enabled.gif" alt="" />
                    <input type="radio" id="preview_1" name="preview" value="1"{if $preview eq 1} checked{/if} />
                    <label for="preview_1">Activer</label>
                    <img src="../img/admin/disabled.gif" alt="" />
                    <input type="radio" id="preview_0" name="preview" value="0"{if $preview ne 1} checked{/if} />
                    <label for="preview_0">Désactiver</label>
                </div>
            </div>
        </div>

        <div class="panel-footer">
            <button class="btn btn-default pull-right" name="submit_weekspecials_config" value="1" type="submit">
                <i class="process-icon-save"></i>Enregistrer
            </button>
        </div>
    </div>
</form>

{* Formulaire affichage front *}
<form method="POST" action="" class="defaultForm form-horizontal">
    <div class="panel">

        <div class="panel-heading">
            <h2><i class="icon-calendar"></i>&nbsp;Saisissez ici les plats de la semaine</h2>
        </div>
        
        <div class="panel-body">
            <div class="form-group">
                <label class="label control-label col-sm-3">Saisissez ici la date de votre choix</label>
                <div class="col-sm-9">
                    <input type="date" name="date[0]" />
                    <input type="date" name="date[1]" />
                </div>
            </div>
            <h3><a href="#monday" data-toggle="collapse">Monday <span class="icon-arrow-down"></span></a></h3>
            <div id="monday" class="form-group collapse">
                <div class="col-sm-4">
                    <label>Entrée du jour</label>
                    <textarea name="monday[0]"></textarea>
                    {* <label>Vegetarian dish</label>
                    <input type="checkbox" name="menu[0][first_course][vg]" />
                    <label>Porkfree dish</label>
                    <input type="checkbox" name="menu[0][first_course][hallal]"  /> *}
                </div>
                <div class="col-sm-4">
                    <label>Salade du jour</label>                
                    <textarea name="monday[1]"></textarea>
                    {* <label>Vegetarian dish</label>
                    <input type="checkbox" name="monday[1]option[0]" value="vg" />
                    <label>Porkfree dish</label>
                    <input type="checkbox" name="monday[1]option[1]" value="hallal" /> *}
                </div>
                <div class="col-sm-4">
                    <label>Plat du jour</label>
                    <textarea name="monday[2]"></textarea>
                    {* <label>Vegetarian dish</label> *}
                    {* <input type="checkbox" name="monday[2]option[0]" value="vg" />
                    <label>Porkfree dish</label>
                    <input type="checkbox" name="monday[2]option[1]" value="hallal" /> *}
                </div>
            </div>
            <h3><a href="#tuesday" data-toggle="collapse">Tuesday <span class="icon-arrow-down"></span></a></h3>
            <div id="tuesday" class="form-group collapse">
                <div class="col-sm-4">
                    <label>Plat du jour</label>
                    <textarea name="tuesday[0]"></textarea>
                    {* <label>Vegetarian dish</label>
                    <input type="checkbox" name="option[]" value="vg" />
                    <label>Porkfree dish</label>
                    <input type="checkbox" name="option[]" value="hallal" /> *}
                </div>
                <div class="col-sm-4">
                    <label>Salade du jour</label>                
                    <textarea name="tuesday[1]"></textarea>
                    {* <label>Vegetarian dish</label>
                    <input type="checkbox" name="option[]" value="vg" />
                    <label>Porkfree dish</label>
                    <input type="checkbox" name="option[]" value="hallal" /> *}
                </div>
                <div class="col-sm-4">
                    <label>Dessert du jour</label>
                    <textarea name="tuesday[2]"></textarea>
                    {* <label>Vegetarian dish</label>
                    <input type="checkbox" name="option[]" value="vg" />
                    <label>Porkfree dish</label>
                    <input type="checkbox" name="option[]" value="hallal" /> *}
                </div>
            </div>
            <h3><a href="#wednesday" data-toggle="collapse" > Wednesday <span class="icon-arrow-down"></span></a></h3>
            <div id="wednesday" class="form-group collapse">
                <div class="col-sm-4">
                    <label>Plat du jour</label>
                    <textarea name="wednesday[0]"></textarea>
                    {* <label>Vegetarian dish</label>
                    <input type="checkbox" name="option[]" value="vg" />
                    <label>Porkfree dish</label>
                    <input type="checkbox" name="option[]" value="hallal" /> *}
                </div>
                <div class="col-sm-4">
                    <label>Salade du jour</label>                
                    <textarea name="wednesday[1]"></textarea>
                    {* <label>Vegetarian dish</label>
                    <input type="checkbox" name="option[]" value="vg" />
                    <label>Porkfree dish</label>
                    <input type="checkbox" name="option[]" value="hallal" /> *}
                </div>
                <div class="col-sm-4">
                    <label>Dessert du jour</label>
                    <textarea name="wednesday[2]"></textarea>
                    {* <label>Vegetarian dish</label>
                    <input type="checkbox" name="option[]" value="vg" />
                    <label>Porkfree dish</label>
                    <input type="checkbox" name="option[]" value="hallal" /> *}
                </div>
            </div>
            <h3><a href="#thursday" data-toggle="collapse">Thursday <span class="icon-arrow-down"></span></a></h3>
            <div id="thursday"  class="form-group collapse">
                <div class="col-sm-4">
                    <label>Plat du jour</label>
                    <textarea name="thursday[0]"></textarea>
                    {* <label>Vegetarian dish</label>
                    <input type="checkbox" name="option[]" value="vg" />
                    <label>Porkfree dish</label>
                    <input type="checkbox" name="option[]" value="hallal" /> *}
                </div>
                <div class="col-sm-4">
                    <label>Salade du jour</label>                
                    <textarea name="thursday[1]"></textarea>
                    {* <label>Vegetarian dish</label>
                    <input type="checkbox" name="option[]" value="vg" />
                    <label>Porkfree dish</label>
                    <input type="checkbox" name="option[]" value="hallal" /> *}
                </div>
                <div class="col-sm-4">
                    <label>Dessert du jour</label>
                    <textarea name="thursday[2]"></textarea>
                    {* <label>Vegetarian dish</label>
                    <input type="checkbox" name="option[]" value="vg" />
                    <label>Porkfree dish</label>
                    <input type="checkbox" name="option[]" value="hallal" /> *}
                </div>
            </div>
           <h3><a href="#friday" data-toggle="collapse">Friday<span class="icon-arrow-down"></span></a></h3>
           <div id="friday" class="form-group collapse">
                <div class="col-sm-4">
                    <label>Plat du jour</label>
                    <textarea name="friday[0]"></textarea>
                    {* <label>Vegetarian dish</label>
                    <input type="checkbox" name="option[]" value="vg" />
                    <label>Porkfree dish</label>
                    <input type="checkbox" name="option[]" value="hallal" /> *}
                </div>
                <div class="col-sm-4">
                    <label>Salade du jour</label>                
                    <textarea name="friday[1]"></textarea>
                    {* <label>Vegetarian dish</label>
                    <input type="checkbox" name="option[]" value="vg" />
                    <label>Porkfree dish</label>
                    <input type="checkbox" name="option[]" value="hallal" /> *}
                </div>
                <div class="col-sm-4">
                    <label>Dessert du jour</label>
                    <textarea name="friday[2]"></textarea>
                    {* <label>Vegetarian dish</label>
                    <input type="checkbox" name="option[]" value="vg" />
                    <label>Porkfree dish</label>
                    <input type="checkbox" name="option[]" value="hallal" /> *}
                </div>
            </div>
                  
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
            <h2><i class="icon-cogs"></i><a href="#preview" data-toggle="collapse">&nbsp;Preview<span class="icon-arrow-down"></span></a></h2>
        </div>
        
        <div id="preview" class="panel-body collapse">
            {include file=$path}
        </div>

        <div class="panel-footer">
        </div>
</section>

{* Espace de customisation template hook front *}
<section class="panel">
    <div class="panel-heading">
        <h2><i class="icon-cogs"></i><a href="#wysiwyg" data-toggle="collapse">&nbsp;WYSIWYG<span class="icon-arrow-down"></span></a></h2>
    </div>

    <div id="wysiwyg" class="panel-body collapse">
        <textarea>
        WYSIWYG
        </textarea>
    </div>

    <div class="panel-footer">
    </div>
</section>
