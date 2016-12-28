post '/questions/:question_id/answers' do
  @question = Question.find_by(id: params[:question_id])
  content = params[:content]
  @answer = Answer.new(content: content, author_id: session[:user_id], question_id: @question.id)
  if request.xhr?
    if @answer.save
      return erb :'partials/_answer_show', layout: false, locals: { answer: @answer }
    else
      status 412
    end
  else
    redirect "/questions/#{@question.id}"
  end
end


