$(document).on('ready page:load page:change', function(){
  $("#search_dropdown li").on("click", function(event){
    event.preventDefault()

    var search_text = $(this).find("a").text()
    var field_id = "q " + search_text + " cont"
    var field_name = "q[" + search_text + " cont]"

    $(".search_text").text(search_text);
    $('#search_dropdown li').removeClass('active')
    $(this).addClass('active')

    field_id = field_id.replace(/ /g,"_").toLowerCase();
    field_name = field_name.replace(/ /g,"_").toLowerCase();

    $('.search_field').attr('id', field_id)
    $('.search_field').attr('name', field_name)
  });
});
