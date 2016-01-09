get '/choices/new' do
  @choice_numbers = (1..params[:question_choices].to_i).to_a
  @question = Question.create(params[:question])
  @survey = @question.survey
  erb :'/choices/new'
end

post '/choices' do
  @survey = Survey.find_by(id: params[:survey_id])
  @choice = Choice.new(params[:choice])
  unless @choice.save
    @errors = @choice.errors
  end
  erb :'/choices/new'
end
