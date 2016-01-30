get '/questions/:question_id/choices/new' do
	@question = Question.find_by(id: params[:question_id])
	erb :'/choices/new'
end

post '/choices' do 
	@new_choice = Choice.new(params[:choice])
	if @new_choice.save
		redirect "/questions/#{@new_choice.question_id}/choices/new"
	else 
		redirect "/oops"
	end
end

get '/questions/:question_id/choices/:id/edit' do
	@question = Question.find_by(id: params[:question_id])
	@choice = Choice.find_by(id: params[:id])
	erb :'/choices/edit'
end

put '/choices/:id' do
	@choice = Choice.find_by(id: params[:id])
	@choice.update_attributes(params[:choice])
	redirect "/questions/#{@choice.question_id}/show"
end

delete '/choices/:id' do
	choice = Choice.find_by(id: params[:id])
	question = Question.find_by(id: choice.question_id)
	choice.destroy
	redirect "/questions/#{question.id}/show"
end