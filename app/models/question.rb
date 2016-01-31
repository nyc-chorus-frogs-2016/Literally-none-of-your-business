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

end
