$(window).load(function(){
    $('input').focus(function(){
        $('input[name="'+name+'"').keyup(function(){
            var value=$(this).val();
            $('.'+name).text(value);
        })
    })
})