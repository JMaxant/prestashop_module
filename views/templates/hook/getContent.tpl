{* Affichage confirmation de soumission formulaires *}
{if isset($confirmation)}
<div class="alert alert-success">
    <p>La configuration a bien été sauvegardée.</p>
</div>
{elseif isset($reset)}
<div class="alert alert-success">
    <p>La réinitialisation a bien été effectuée</p>
</div>
{/if}

{* CONFIGURATION FORM *}
{$config}
{* /CONFIGURATION FORM *}

<section class="panel">
    <form method="POST" action="" class="defaultForm form-horizontal">
        <div class="panel-header">
            <div class="panel-body">
                <div class="col-sm-12 alert alert-warning">
                    <p>En cliquant sur le bouton ci-dessous, vous remettrez les paramètres de configuration du module à leurs réglages par défaut.<br/>
                    Les allergènes seront remis à leur valeur par défaut.
                    </p>
                </div>
            </div>
            <div class="panel-footer">
                <button class="btn btn-default pull-right" name="submit_weekspecial_default" value="1" type="submit">
                    <i class="process-icon-refresh"></i>Réinitialiser
                </button>
            </div>
        </div>
    </form>
</section>