$(document).ready(function() {

  $('#add-question-link').on('click', function(event){
    event.preventDefault();


    var requestUrl = $(event.target).attr('href');

    requestOptions = {url: requestUrl};

    var deferredObject = $.ajax(requestOptions);


    deferredObject.done(function(response){

      $('#survey-details').append(response);
    });

    deferredObject.fail(function(response){
      console.log(response);
    });

  });

  $('#survey-details').on('submit', 'form#create-question', function(event){
    event.preventDefault();

    var requestOptions = {url: $(event.target).attr('action'),
                          method: $(event.target).attr('method'),
                          data: $(event.target).serialize(),
                          dataType: 'html'};

    $.ajax(requestOptions).done(function(response){

      $('form#create-question').remove();
      // MAKE ANOTHER GET REQUEST TO THE CHOICES FORM
      $('ul#current-questions').append('<li>' + response + '</li>');
      //debugger;
    }).fail(function(response){console.log(response)});






  });


});


// $(document).ready(function() {

//   $('#new-horse').on('click', function(event){
//     event.preventDefault();

//     var url = $(event.target).attr('href');

//     var formGet = $.ajax({url: url,
//       method: 'GET',
//       dataType: 'html'});

//     formGet.done(function(response){
//       $('#horse-list').append(response);
//       $('#new-horse').hide();
//     });

//     formGet.fail(function(response){
//       console.log(response);
//     });
//   });

//   $('#horse-list').on('click', 'a', function(event){
//     event.preventDefault();

//     var myH3 = $(event.target).parent()

//   $(myH3.children('div')).remove();




//     var url = $(event.target).attr('href');

//     var detailsGet = $.ajax({url: url,
//                             method: 'GET',
//                             data: '',
//                             dataType: 'html'});


//     detailsGet.done(function(response){
//       $(myH3).append(response);
//     });

//     detailsGet.fail(function(response){
//       console.log(response);
//     });


//   });



//   $('#horse-list').on('submit', '#horse-form', function(event){
//     event.preventDefault();
//     var url = $(event.target).attr('action');

//     var formPost = $.ajax({url: url,
//       method: 'POST',
//       data: $(event.target).serialize(),
//       dataType: 'html'});

//     formPost.done(function(response){
//       $('#new-horse-form-container').remove();
//       $('#new-horse').show();
//       $('#horse-list').append(response);
//     });

//     formPost.fail(function(response){
//       console.log(response);
//     });

//   });

// });



// // Ajax is a set of tools used to send data asynchronously between the
// // server and the browser (frequently in combination with the Jquery
// // library) in order to speed up the rate at which information is sent
// // and received.
// // To make an ajax call you need to provide the URL, the method, the
// // data (for a post or put/patch), and the dataType that is expected
// // back. An ajax call returns a "deferred object" which has the methods
// // done and fail which take a callback (the arguement passed into the
// // callback is the response) and then you can act on the response.
