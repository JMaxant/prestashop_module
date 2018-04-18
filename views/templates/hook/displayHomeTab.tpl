<section class="col-sm-12">
    <br/>
    <h2 class="text-center">Les recettes de la semaine</h2>
    <h3 class="text-center">du {$dates.0} au {$dates.1}</h3>
    <table class="table col-sm-12">
        <thead>
            <tr>
                <th></th>
                {foreach from=$courses item=course}
                <th>{$course|upper}</th>
                {/foreach}
            </tr>
        </thead>
        <tbody>
        {capture}{assign "i" 0}{/capture}
        {foreach from=$ws_days item=day}
            <tr>
                <td><strong>{$day|upper}</strong></td>
            {foreach from=$menu.$i item=course}
                <td>
                    {$course.name<br/>
                    {$course.vg}
                    {$course.pork}
                    {if isset($course.allergene)&&!empty($course.allergene)}
                        <p title="Contient des {foreach from=$course.allergene item=allergene}{$allergene} {/foreach} "><small>Informations allergènes</small></p>
                    {/if}
                </td>
            {/foreach}
                {capture}{$i++}{/capture}
            </tr>
        {/foreach}
        </tbody>
        <tfooter>
            <tr>
                <td colspan="4" class="text-center">
                    N'hésitez pas à contacter nos boutiques pour plus de renseignements !
                </td>
            </tr>
        </tfooter>
    </table>
</section>
