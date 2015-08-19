$(document).ready(function(){
  bindOrderButton()
})

var bindOrderButton = function(){
  $("div.orders").on("submit", ".button_to", function(event){
    event.preventDefault()

    request = $.ajax({
      url: $(this).attr("action"),
      dataType: "html"
    })

    request.done(function(responseData){
      $(".new_order_form").append(responseData)
    })
  })
}
