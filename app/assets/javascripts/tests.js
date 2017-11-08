$(document).ready(function() {

    //текущий урл
    var url = window.location.href;
    var arr = url.split('/');
    var id = arr[arr.length-1];
    var last_url = arr[arr.length-2];

    if(last_url == 'tests') {

        $.post(
            "/tests/"+ id,
            function (data) {
                var box = $('.question_text');
                box.empty();

                 box.append(
                     "<input value='"+data.test_id+"' type='hidden' name='test_id' id='test_id'>"
                 );

                $.each(data.questions, function(key, value){
                    box.append(
                        "<table class = 'table table-striped'>"+
                        "<tr>"+
                        "<td>"+value.question+"</td>"+
                        "</tr>"+
                        "<tr>"+
                        "<td>" +
                        "<input required='required' placeholder='Ваш ответ*' type='text' name='question[]' id='question_"+value.id+"'>"+
                        "</td>"+
                        "</tr>"
                    );
                });
            }
        );
    }

});

