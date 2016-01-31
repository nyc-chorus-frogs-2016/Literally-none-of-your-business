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
    redirect "surveys/#{new_survey.id}"
  else
    redirect '/oops'
  end
end

get '/surveys/:id' do
  @survey = Survey.find_by(id: params[:id])
  # @survey.update_attributes(active?: 0)
  # erb :'/surveys/show'
  if request.xhr?
    erb :'/surveys/show', layout: false
  else
    erb :'/surveys/show'
  end
end

post '/surveys/:id' do
  @survey = Survey.find_by(id: params[:id])
  @survey.update_attributes(active?: 1)
  redirect "/surveys/#{@survey.id}"
end
