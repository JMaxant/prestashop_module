$(document).ready(function(){
    var count=$('.ws_input_dishes').length;
    for(var i=1; i<=count; i++){
        $('input[name="courses['+i+']').keyup(function(){
            var value=$(this).val();
            $("#label_"+i).text(value);
        })
    }
})