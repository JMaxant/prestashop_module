<section class="col-sm-12">
    <h2 class="text-center">Les recettes de la semaine</h2>
    <h3 class="text-center">du {$dates.0} au {$dates.1}</h3>
    <table class="table">
        <thead>
            <tr>
                <th></th>
                <th>L'Entrée</th>
                <th>La Salade</th>
                <th>Le Plat</th>
            </tr>
        </thead>
        <tbody>
            {if !empty($monday)}
            <tr>
                <td><strong>Lundi</strong></td>
                <td>{$monday.0}</td>
                <td>{$monday.1}</td>
                <td>{$monday.2}</td>
            </tr>
            {/if}
            {if !empty($tuesday)}
            <tr>
                <td><strong>Mardi</strong></td>
                <td>{$tuesday.0}</td>
                <td>{$tuesday.1}</td>
                <td>{$tuesday.2}</td>
            </tr>
            {/if}
            {if !empty($wednesday)}
            <tr>
                <td><strong>Mercredi</strong></td>
                <td>{$wednesday.0}</td>
                <td>{$wednesday.1}</td>
                <td>{$wednesday.2}</td>
            </tr>
            {/if}
            {if !empty($thursday)}
            <tr>
                <td><strong>Jeudi</strong></td>
                <td>{$thursday.0}</td>
                <td>{$thursday.1}</td>
                <td>{$thursday.2}</td>
            </tr>
            {/if}
            {if !empty($friday)}
            <tr>
                <td><strong>Vendredi</strong></td>
                <td>{$friday.0}</td>
                <td>{$friday.1}</td>
                <td>{$friday.2}</td>
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
