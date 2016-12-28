get '/questions' do
	@questions = Question.all

	erb :'questions/index'
end

get '/questions/new' do
	authentication_required
	erb :'questions/new'
end

get '/questions/:id' do
	@question = Question.find_by(id: params[:id])
	@question_comments = @question.comments
	@answers = @question.answers
	p @answers

	erb :'questions/show'
end

post '/questions' do
	authentication_required
	@question = Question.new( author_id: active_user.id, title: params[:title], content: params[:content] )

	if @question.save
		# redirect to '/question/post.id'
		redirect '/'
	else
		@errors = @question.errors.full_messages
		redirect '/questions/new'
	end
end
