get '/surveys/:survey_id/questions/new' do
  @current_survey = Survey.find_by(id: params[:survey_id])

  if request.xhr?
    erb :'/questions/new', layout: false
  else
    erb :'/questions/new'
  end
end

post '/questions' do
  new_question = Question.new(params[:question])
  if new_question.save
    if request.xhr?
      erb :'/questions/_question', layout: false, locals: {question: new_question, survey: new_question.survey}
    else
      redirect "/questions/#{new_question.id}/choices/new"
    end
  else
    redirect '/oops'
  end
end

get '/questions/:id/show' do
  @question = Question.find_by(id: params[:id])
  @survey = @question.survey
  @choices = @question.choices
  erb :'/questions/show'
end

get '/questions/:id/edit' do
  @question = Question.find_by(id: params[:id])
  erb :'/questions/edit'
end

put '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  @question.update_attributes(params[:question])
  redirect "/questions/#{@question.id}/show"
end

delete '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  @question.destroy
  redirect "/surveys/#{@question.survey_id}"
end
