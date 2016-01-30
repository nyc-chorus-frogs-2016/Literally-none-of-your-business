get '/surveys/:survey_id/questions/new' do 
	@current_survey = Survey.find_by(id: params[:survey_id])
	erb :'/questions/new'
end

post '/questions' do
	# this_survey = Survey.find_by(id: params[:survey]["survey_id"])
	new_question = Question.new(params[:question])
	# binding.pry
	if new_question.save
		# this_survey.questions << new_question
		redirect "/questions/#{new_question.id}/choices/new"
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