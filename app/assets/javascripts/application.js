// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){
      $("#search_dropdown li").click(function(event){
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