
{* Affichage confirmation de soumission formulaires *}
{if isset($confirmation)}
<div class="alert alert-success">
    <p>La configuration a bien été sauvegardée.</p>
</div>
{/if}
{$config}
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
            <div id="monday" class="form-group collapse in">
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
                    <textarea name="tuesday[0]"></textarea> *}
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
                /div>
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
            
            <div id="preview" class="panel-body collapse in">
                {include file=$path}
            </div>

            <div class="panel-footer">
            </div>
    </section>

{* Espace de customisation template hook front *}
{if $template eq 1}
    <section class="panel">
        <form method="POST" action="" class="defaultForm form-horizontal">
            <div class="panel-heading">
                <h2><i class="icon-cogs"></i><a href="#template" data-toggle="collapse">&nbsp;template<span class="icon-arrow-down"></span></a></h2>
            </div>

            <div class="panel-body collapse in">
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
