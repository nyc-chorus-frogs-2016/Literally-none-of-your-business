$(document).ready(function() {

  $('#add-question-link').on('click', function(event){
    event.preventDefault();
  //when we add a question to the survey we should delete any previous choice-forms
    $('form#create-choice').remove();
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

    var questionRequestOptions = {url: $(event.target).attr('action'),
                          method: $(event.target).attr('method'),
                          data: $(event.target).serialize(),
                          dataType: 'html'};

    getQuestionDiv = $.ajax(questionRequestOptions).done(function(response){
      $('div#new-question-form').remove();
      $('ul#current-questions').append('<li>' + response + '</li>');
      }).fail(function(response){console.log(response)
    });


    $.when(getQuestionDiv).then(function() {
    var choiceRequestOptions = {url: $('.question-choices form').last().attr('action') + '/choices/new',
                                method: 'get',
                                data: "",
                                dataType: 'html'};


      getChoiceDiv = $.ajax(choiceRequestOptions).done(function(response){
        $('div#new-question-form').remove()
        $('#current-questions li:last-child div').append(response);
        }).fail(function(response){console.log(response)
      });
    });

  });



  $('#current-questions').on('submit', 'form#create-choice', function(event){
    event.preventDefault();

    var choicePostRequestOptions = {url: $(event.target).attr('action'),
                                    method: $(event.target).attr('method'),
                                    data: $(event.target).serialize(),
                                    dataType: 'html',
                                    target: $(event.target)};

   postChoice = $.ajax(choicePostRequestOptions).done(function(response){
      choicePostRequestOptions.target[0].reset();
      choicePostRequestOptions.target.parent().children().first().append('<p>' + response + '</p>');
   }).fail(function(response){console.log(response)});
  });
});
