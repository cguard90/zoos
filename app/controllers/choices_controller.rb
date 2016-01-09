get '/choices/new' do
  @choice_numbers = (1..params[:question_choices].to_i).to_a
  @question = Question.create(params[:question])
  @survey = @question.survey
  erb :'/choices/new'
end

post '/choices' do
  @survey = Survey.find_by(id: params[:survey_id])
  @question = Question.find_by(id: params[:question_id])
  @choice = Choice.new(params[:choice])
  if @choice.save
    PotentialReply.create(choice: @choice, question: @question)
  else
    @errors = @choice.errors
  end
  erb :'/choices/new'
end
