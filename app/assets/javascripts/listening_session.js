$(document).ready(function(){
  console.log("Hello");

  $("#create-listen").on('click', function(){
    var userId = $("#user-id").data("target")
    var itemId = $("#item-id").data("target")
    var itemType = $("#item-type").data("target")
    var itemName = $("#item-name").data("target")
    var playlistOwnerId = $("#playlist-owner-id").data("target")

    $.ajax({
      url: "/api/v1/listening_sessions.json",
      method: "POST",
      dataType: "JSON",
      data: {listening_session: {user_id: userId, item_id: itemId, item_type: itemType, item_name: itemName, playlist_owner_id: playlistOwnerId } },

      success: function(newListeningSession){
        console.log("Success");
        $("#create-listen").hide();
        $("#session-box").show();
        $("#session-box").append(
         "<div id='session-id' data-target='" + newListeningSession.id +"'></div>"
        )
        $("#session-identifier").text(newListeningSession.item_name);
      }
    })
  });

  $("#save-button").on('click', function(){
    var listeningSessionId = $("#session-id").data("target")
    var agitationBefore    = $("#agitation-before").val()
    var agitationAfter     = $("#agitation-after").val()
    var awarenessBefore    = $("#awareness-before").val()
    var awarenessAfter     = $("#awareness-after").val()
    var communicativenessBefore = $("#communicativeness-before").val()
    var communicativenessAfter = $("#communicativeness-after").val()
    var duration               = $("#duration").val()

    $.ajax({
      url: "/api/v1/listening_sessions/" + listeningSessionId + ".json",
      method: "PATCH",
      dataType: "JSON",
      data: {listening_session: { agitation_before: agitationBefore,
                                  agitation_after: agitationAfter,
                                  awareness_before: awarenessBefore,
                                  awareness_after: awarenessAfter,
                                  communicativeness_before: communicativenessBefore,
                                  communicativeness_after: communicativenessAfter,
                                  duration: duration
                                 }

            },
      success: function(updateListeningSession){
        console.log("Success");
        $("#create-listen").show();
        $("#session-box").hide();
      }
    })
  })

});
