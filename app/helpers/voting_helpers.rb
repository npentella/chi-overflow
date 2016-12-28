helpers do
	def cast_vote(votable, vote_value)
		voter = active_user
		vote = Vote.new(voter: voter,votable: votable, vote_value: vote_value)
		if vote.save
			status 200
			return votable.vote_sum.to_s if request.xhr?
			redirect request.referer
		else
			return 500 if request.xhr?
			redirect request.referer
		end
	end
	
end