#need to include in all votable classes

module Votable
	def vote_sum
		self.votes.sum(:vote_value)
	end
end