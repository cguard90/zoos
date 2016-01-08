(1..6).to_a.each_with_index do |number|
  user = User.create(email: Faker::Internet.email, password_hash: "pwd")

  survey = Survey.create(title: Faker::Hacker.say_something_smart,
                         description: Faker::Lorem.paragraph,
                         user: user)

  (1..6).to_a.each do |question|
    question = Question.create(body: Faker::Hipster.sentence, survey: survey)
    choice = ''
    (2..4).to_a.each do |choice|
      choice = Choice.create(value: Faker::Hacker.verb, question: question)
    end
    potential_reply = PotentialReply.create(question: question, choice: choice)
    response = Response.create(survey: survey,
                               question: question,
                               user: user,
                               potential_reply: potential_reply)
  end

end
