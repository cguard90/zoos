get '/questions' do
  @survey = Survey.find_by(id: params[:survey_id])
  @questions = @survey.questions
  erb :'/questions/index'
end

get '/questions/new' do
  @survey = Survey.find_by(id: params[:survey_id])
  erb :'questions/new'
end

post '/questions' do
  @question = Question.new(params[:question])
  @survey = @question.survey
  if @question.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @question.errors.full_messages
    erb :'/questions/new'
  end
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  @survey = @question.survey
  @user = @survey.user
  erb :'/questions/show'
end
