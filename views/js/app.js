$(window).load(function(){
    $('input').focus(function(){
        var input=$(this).attr('data-attribute');
        var output='.'+input;
        var name=$(this).attr('name');
        $('input[name="'+name+'"').keyup(function(){
            var value=$(this).val();
            $(output).text(value);
        })
    })
})