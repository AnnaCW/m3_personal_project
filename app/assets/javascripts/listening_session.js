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
    var notes                  = $("#notesTextarea").val()


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
                                  duration: duration,
                                  notes: notes
                                 }

            },
      success: function(updateListeningSession){
        console.log("Success");
        $("#create-listen").show();
        $("#session-box").hide();
      }
    })
  })

  $("#delete-button").on('click', function(){
    var listeningSessionId = $("#session-id").data("target")
    // var agitationBefore    = $("#agitation-before").val()
    // var agitationAfter     = $("#agitation-after").val()
    // var awarenessBefore    = $("#awareness-before").val()
    // var awarenessAfter     = $("#awareness-after").val()
    // var communicativenessBefore = $("#communicativeness-before").val()
    // var communicativenessAfter = $("#communicativeness-after").val()
    // var duration               = $("#duration").val()
    // var notes                  = $("#notesTextarea").val()

    $.ajax({
      url: "/api/v1/listening_sessions/" + listeningSessionId + ".json",
      method: "DELETE",
      dataType: "JSON",
      // data: {listening_session: { agitation_before: agitationBefore,
      //                             agitation_after: agitationAfter,
      //                             awareness_before: awarenessBefore,
      //                             awareness_after: awarenessAfter,
      //                             communicativeness_before: communicativenessBefore,
      //                             communicativeness_after: communicativenessAfter,
      //                             duration: duration,
      //                             notes: notes
      //                            }
            //
            // },
      success: function(deleteListeningSession){
        console.log("Success");
        $("#create-listen").show();
        $("#session-box").hide();
      }
    })
  })


  $(".show-session").on('click', function(){
    var listeningSessionId = $(this).data("target")
    $(".session-box[id=" + listeningSessionId + "]").toggle("style");

    // var listeningSessionId = $("#ls-id").data("target")
    // var agitationBefore    = $("#agitation-before").val()
    // var agitationAfter     = $("#agitation-after").val()
    // var awarenessBefore    = $("#awareness-before").val()
    // var awarenessAfter     = $("#awareness-after").val()
    // var communicativenessBefore = $("#communicativeness-before").val()
    // var communicativenessAfter = $("#communicativeness-after").val()
    // var duration               = $("#duration").val()
    // var notes                 = $("#notesTextarea").text()
   })

  $(".update-button").on('click', function(){
    var listeningSessionId = $(this).data("target")

    // var listeningSessionId = $("#ls-id").data("target")
    var agitationBefore    = $(".agitation-before[id=" + listeningSessionId + "]").val()
    var agitationAfter     = $(".agitation-after[id=" + listeningSessionId + "]").val()
    var awarenessBefore    = $(".awareness-before[id=" + listeningSessionId + "]").val()
    var awarenessAfter     = $(".awareness-after[id=" + listeningSessionId + "]").val()
    var communicativenessBefore = $(".communicativeness-before[id=" + listeningSessionId + "]").val()
    var communicativenessAfter = $(".communicativeness-after[id=" + listeningSessionId + "]").val()
    var duration               = $(".duration[id=" + listeningSessionId + "]").val()
    var notes                 = $(".notesTextarea[id=" + listeningSessionId + "]").val()


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
                                  duration: duration,
                                  notes: notes
                                 }

            },
      success: function(updateListeningSession){
        console.log("Success");
        $(".session-box").hide();
      }
    })
  })

});
