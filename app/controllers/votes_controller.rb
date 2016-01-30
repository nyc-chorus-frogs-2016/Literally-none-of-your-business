post '/votes' do
  this_taken_survey = TakenSurvey.find_by(id: params[:taken_survey]["id"])
  new_vote = Vote.new(params[:vote])
  if new_vote.save
    redirect "/taken_surveys/#{this_taken_survey.id}/votes/new"
  else
    redirect '/oops'
  end
end
