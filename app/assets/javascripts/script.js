$(function() {
  $.ajax({
    beforeSend: function(request) {
    request.setRequestHeader("Authorization", 'Bearer ');
    },
    url: "https://api.spotify.com/v1/browse/categories",

    jsonpCallback: "listCategories",

    dataType: "jsonp",

    });

  });

  function listCategories(response) {
      console.log(response);
       $.each(response.responseData.entries, function (i,cat) {
      $("#browse-categories").append("<li>"+cat.name+"</li>");
      });
  }



    // $.ajax({
    //     beforeSend: function(request) {
    //     request.setRequestHeader("X-Mashape-Key", 'key_here');
    //       },
    //     dataType: "json",
    //     // url: settings.apiPath + settings.username + '/boards/',
    //     url:
    //     success: function(data) {
    //             //Your code
    //         }
    //     });
