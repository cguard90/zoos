get '/choices/new' do
  @choice_numbers = (1..params[:question_choices].to_i).to_a
  @question = Question.create(params[:question])
  erb :'/choices/new'
end

post '/choices' do
  @choice = Choice.create(params[:choice])
  erb :'/choices/new'
end