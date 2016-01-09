get '/questions/new' do
  @survey = Survey.find_by(id: params[:survey_id])
  erb :'questions/new'
end

post '/questions' do
  @question = Question.new(params[:question])
  @survey = @question.survey
  if @question.save
    erb :'/choices/new'
  else
    @errors = @question.errors.full_messages
    erb :'/questions/new'
  end
end