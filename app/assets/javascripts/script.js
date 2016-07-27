// $(document).ready(function(){
//
//   var $genres = $('.genre');
//
//   $('#genre-dropdown').on("change", function(){
//     var currentGenre = this.value;
//     $genres.each(function (index, genre) {
//       var $genre = $(genre);
//       if($genre.data("genre") === currentGenre) {
//         $genre.show();
//       } else {
//         $genre.hide();
//       }
//     })
//
//   })
//
// });

// $('#genre-dropdown').val();


// $(function() {
//   $.ajax({
//     beforeSend: function(request) {
//     request.setRequestHeader("Authorization", 'Bearer ');
//     },
//     url: "https://api.spotify.com/v1/browse/categories",
//
//     jsonpCallback: "listCategories",
//
//     dataType: "jsonp",
//
//     });
//
//   });
//
//   function listCategories(response) {
//       console.log(response);
//        $.each(response.responseData.entries, function (i,cat) {
//       $("#browse-categories").append("<li>"+cat.name+"</li>");
//       });
//   }



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
