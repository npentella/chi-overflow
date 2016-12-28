commentable_types = ['Question', 'Answer']
votable_types = ['Question', 'Answer', 'Comment']

User.create(username: 'test', email: 'test@gmail.com', password: 'password')
User.create(username: 'chi4life', email: 'user1@gmail.com', password: 'password')
User.create(username: 'secondcity2none', email: 'user2@gmail.com', password: 'password')
User.create(username: 'chitownlivin', email: 'user3@gmail.com', password: 'password')
User.create(username: 'westtownbesttown', email: 'user4@gmail.com', password: 'password')
User.create(username: 'greektowngyroking', email: 'user5@gmail.com', password: 'password')


Question.create(title: "Chicago Marathon", content: "I really want to run in the marathon, but only have 2 weeks to train - is this feasible?", author_id: rand(2..6))
Question.create(title: "DBC Chicago", content: "I hear the Chicago DBC campus is pretty much the coolest place ever, should I apply?", author_id: rand(2..6))
Question.create(title: "Pizza", content: "Deep dish or thin crust... help me settle this debate once and for all.  Which is the best pizza in Chicago?", author_id: rand(2..6))
Question.create(title: "Good concerts?", content: "Anybody know of good shows coming to town?", author_id: rand(2..6))
Question.create(title: "Winter is coming", content: "Are the winters really THAT bad?", author_id: rand(2..6))


Answer.create(content: "Um.... no.", question_id: 1, author_id: rand(2..6))
Answer.create(content: "Are you awesome?  Then yeah, you should definitely apply.", question_id: 2, author_id: rand(2..6))
Answer.create(content: "I think you just missed Kanye, bummer :(", question_id: 4, author_id: rand(2..6))
Answer.create(content: "YES. Buy a full body coat that looks like it could double as a sleeping bag immediately. You will thank me later, trust me.", question_id: 5, author_id: rand(2..6))
Answer.create(content: "Eh... you'll be fine as long as Snowmageddon doesn't return.", question_id: 5, author_id: rand(2..6))
Answer.create(content: "Are you an experienced runner?  If so, then maybe... though it sounds like you probably need to sit this one out.  Better luck next time!", question_id: 1, author_id: rand(2..6))

20.times { Answer.create(content: Faker::Hipster.sentence(3), question_id: rand(1..5), author_id: rand(2..6)) }


100.times { Comment.create(content: Faker::Hipster.sentence(3), author_id: rand(2..6), commentable_type: commentable_types.sample, commentable_id: rand(1..25)) }


50.times { Vote.create(voter_id: rand(2..6), vote_value: 1, votable_id: rand(1..25), votable_type: votable_types.sample) }

15.times { Vote.create(voter_id: rand(2..6), vote_value: (-1), votable_id: rand(1..25), votable_type: votable_types.sample) }