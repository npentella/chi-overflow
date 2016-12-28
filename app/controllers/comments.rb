post '/questions/:question_id/comments' do
	if request.xhr?
		commentable = Question.find_by(id: params[:question_id])
		comment = create_comment(params[:content], commentable)
		if comment
			response = {username: active_user.username, content: comment.content, created_at: comment.created_at}
			content_type :json
			response.to_json
		else
			status 400
		end
	else
		p "handle none js"
	end
end

post '/answers/:answer_id/comments' do
	if request.xhr?
		p"2"
		commentable = Answer.find_by(id: params[:question_id])
		p"3"
		comment = create_comment(params[:content], commentable)
		p"4"
		if comment
			response = {username: active_user.username, content: comment.content, created_at: comment.created_at}
			content_type :json
			response.to_json
		else
			status 400
		end
	else
		p"2"
		p "handle none js"
	end
end
