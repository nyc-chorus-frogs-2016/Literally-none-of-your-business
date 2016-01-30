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