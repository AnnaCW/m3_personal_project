$(function() {
  $.ajax({
    beforeSend: function(request) {
    request.setRequestHeader("Authorization", 'Bearer BQAdaiUyRanPFiBaYZmdRgo-50C-k43-WHEVj5XOXAnQlvjTfbeAV6FOLT93qoydiw3mbM4k81dvCAB3oVgGGIf4J5r10m6KnqlRLp6wEy49vhfriC_D7M5uYF9W-znxmihRp4jN4A');
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
