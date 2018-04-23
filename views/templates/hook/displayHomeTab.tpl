<section class="col-sm-12 ws_content_render">
    <h2 class="text-center">Les recettes de la semaine</h2>
{if isset($dates)}
    <h3 class="text-center">du {$dates.0} au {$dates.1}</h3>
{/if}
    <table class="table table-bordered preview">
        <thead>
            <tr>
                <th></th>
                {foreach from=$courses item=course}
                <th class="table_render"><span>{$course|upper}</span></th>
                {/foreach}
            </tr>
        </thead>
        <tbody>
        {capture}{assign "i" 0}{/capture}
        {foreach from=$ws_days item=day}
            <tr>
                <th scope="row">{$day|upper}</th>
                {foreach from=$menu.$i item=course}
                <td class="table_render">
                    <p>{$course.name}</p><br/>
                    {if isset($course.vg)&&($course.vg eq 1)}
                        <img class="picto" src="{$module_dir}views/img/veg.png" alt="Plat végétarien" title="Plat végétarien" />
                    {/if}
                    {if isset($course.pork)&&($course.pork eq 1)}
                        <img class="picto" src="{$module_dir}views/img/pork.png" alt="Plat sans porc" title="Plat sans porc" />
                    {/if}
                    {if isset($course.allergene)&&!empty($course.allergene)}
                        <p title="Contient des {foreach from=$course.allergene item=allergene}{$allergene} {/foreach} "><small>Informations allergènes</small></p>
                    {/if}
                </td>
                {/foreach}
        {capture}{$i++}{/capture}
            </tr>
        {/foreach}
        </tbody>
        <tfoot>
            <tr>
                <td colspan="{$i+1}" class="text-center">
                    N'hésitez pas à contacter nos boutiques pour plus de renseignements !
                </td>
            </tr>
        </tfoot>
    </table>
</section>