post '/answers' do
  question = Question.find_by(id: params[:answer][:question_id])
  survey = question.survey

  potential_reply = PotentialReply.find_by(question_id: question.id,
                            choice_id: params[:answer][:choice_id])

  @answer = Answer.new(user: current_user,
                           question: question,
                           survey: survey,
                           potential_reply: potential_reply)

  @errors = @answer.errors.full_messages unless @answer.save

  next_question =  Question.find_by(id: (@answer.question.id+1))
  if next_question && next_question.survey == @answer.survey
    redirect "/questions/#{next_question.id}"
  else
    redirect '/'
  end
end
