helpers do
	def create_comment(content, commentable)
		author_id = active_user.id
		comment = Comment.new(content: content, commentable: commentable, author_id: author_id)
		if comment.save()
			return comment
		nil
		end
	end
end