get '/' do 
  unless logged_in?
	redirect '/users/new'
  else
	redirect '/surveys'
  end
end

get '/surveys' do
	@surveys = Survey.all
  	erb :'/surveys/index'
end

get '/surveys/new' do
  erb :'/surveys/new'
end

post '/surveys' do
	new_survey = Survey.new(params[:survey])
	if new_survey.save
  		redirect "surveys/#{new_survey.id}/questions/new"
  	else
  		redirect '/oops'
  	end
end

