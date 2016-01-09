get '/choices/new' do
  @choice_numbers = (1..params[:question_choices].to_i).to_a
  @question = Question.create(params[:question])
  @survey = @question.survey
  erb :'/choices/new'
end

post '/choices' do
  @survey = Survey.find_by(id: params[:survey_id])
  @choice = Choice.create(params[:choice])
  erb :'/choices/new'
end
