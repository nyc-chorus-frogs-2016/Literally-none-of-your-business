class Question < ActiveRecord::Base
	has_many :choices
	belongs_to :survey

  def answered?(this_user)
    self.choices.each do |choice|
      if !choice.votes.empty?
       return true if choice.votes.select{|vote| vote.voter_id == this_user.id}.any?
      end
    end
    false
  end

    # all_votes = self.choices.map { |choice| choice.votes.to_a }.flatten
    # all_votes_voters = all_votes.map { |vote| vote.voter_id}

    # if all_votes_voters.include?(current_user.id)
    #   return true
    # else
    #   return false
    # end
      # if choice.votes.empty?
      #  true
      # else false
  #   end
  # end

end
