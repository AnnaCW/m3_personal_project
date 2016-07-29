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
        $("#session-box").append(
          "<div class='listen' data-post-id='" + newListeningSession.id +"'>" + newListeningSession.item_name + "</div>"
        )


      }
    })
  })

});
