get '/surveys' do
  @surveys = Survey.all
  erb :"surveys/index"
end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  erb :"surveys/show"
end