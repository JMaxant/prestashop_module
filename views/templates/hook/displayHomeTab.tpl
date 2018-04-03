<section class="col-sm-12">
    <br/>
    <h2 class="text-center">Les recettes de la semaine</h2>
    <h3 class="text-center">du {$dates.0} au {$dates.1}</h3>
    <table class="table col-sm-12">
        <thead>
            <tr>
                <th></th>
                <th>L'Entrée</th>
                <th>La Salade</th>
                <th>Le Plat</th>
            </tr>
        </thead>
        <tbody>
        {$mon|@var_dump}
            {if !empty($mon)}
            <tr>
                <td><strong>Lundi</strong></td>
                <td>{$mon.0}</td>
                <td>{$mon.1}</td>
                <td>{$mon.2}</td>
            </tr>
            {/if}
            {if !empty($tue)}
            <tr>
                <td><strong>Mardi</strong></td>
                <td>{$tue.0}</td>
                <td>{$tue.1}</td>
                <td>{$tue.2}</td>
            </tr>
            {/if}
            {if !empty($wed)}
            <tr>
                <td><strong>Mercredi</strong></td>
                <td>{$wed.0}</td>
                <td>{$wed.1}</td>
                <td>{$wed.2}</td>
            </tr>
            {/if}
            {if !empty($thu)}
            <tr>
                <td><strong>Jeudi</strong></td>
                <td>{$thu.0}</td>
                <td>{$thu.1}</td>
                <td>{$thu.2}</td>
            </tr>
            {/if}
            {if !empty($fri)}
            <tr>
                <td><strong>Vendredi</strong></td>
                <td>{$fri.0}</td>
                <td>{$fri.1}</td>
                <td>{$fri.2}</td>
            </tr>
            {/if}
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
