post '/comments/:comment_id/votes' do
	votable = Comment.find_by(id: params[:comment_id])
	vote_value = params['vote_value'].to_i
	cast_vote(votable, vote_value)
end

post '/questions/:question_id/votes' do
	votable = Question.find_by(id: params[:question_id])
	vote_value = params['vote_value'].to_i
	cast_vote(votable, vote_value)
end

post '/answers/:answer_id/votes' do
	votable = Answer.find_by(id: params[:answer_id])
	vote_value = params['vote_value'].to_i
	cast_vote(votable, vote_value)
end 

