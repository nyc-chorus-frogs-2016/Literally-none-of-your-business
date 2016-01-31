get '/taken_surveys/:id/votes/new' do
  @taken_survey = TakenSurvey.find_by(id: params[:id])
  @survey = @taken_survey.survey
  @questions = @survey.questions
  erb :'/votes/new'
end

post '/taken_surveys' do
  taken_survey = TakenSurvey.new(params[:taken_survey])
  if taken_survey.save
    redirect "/taken_surveys/#{taken_survey.id}/votes/new"
  else
    redirect '/oops'
  end
end

