get '/choices/new' do
  @question = Question.find_by(id: params[:question_id])
  @survey = @question.survey
  erb :'/choices/new'
end

post '/choices' do
  @survey = Survey.find_by(id: params[:survey_id])
  @question = Question.find_by(id: params[:question_id])
  @choice = Choice.new(params[:choice])
  if @choice.save
    PotentialReply.create(choice: @choice, question: @question)
    redirect "/questions/#{@question.id}"
  else
    @errors = @choice.errors
    erb :'/choices/new'
  end
end
