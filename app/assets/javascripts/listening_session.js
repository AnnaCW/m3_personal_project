$(document).ready(function(){
  console.log("Hello");

  $("#create-listen").on('click', function(){
    var userId = $("#user-id").data("target")
    var itemId = $("#item-id").data("target")
    var itemType = $("#item-type").data("target")
    var itemName = $("#item-name").data("target")

    $.ajax({
      url: "/api/v1/listening_sessions.json",
      method: "POST",
      dataType: "JSON",
      data: {listening_session: {user_id: userId, item_id: itemId, item_type: itemType, item_name: itemName } },

      success: function(newListeningSession){
        console.log("Success");
        $("#create-listen").hide();
        $("#session-box").show();
        $("#session-box").append(
         "<div class='listen' data-session-id='" + newListeningSession.id +"'></div>"
        )
        $("#session-identifier").text(newListeningSession.item_name);
      }
    })
  })

});
