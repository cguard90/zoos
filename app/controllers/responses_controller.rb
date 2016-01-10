
post '/answers' do
  question = Question.find_by(id: params[:answer][:question_id])
  potential_reply = PotentialReply.find_by(question_id: question.id,
                                          choice_id: params[:answer][:choice_id])
  @answer = Answer.new(user: current_user,
                           question: question,
                           survey: question.survey,
                           potential_reply: potential_reply)
  @errors = @answer.errors.full_messages unless @answer.save
    redirect '/questions'
end
