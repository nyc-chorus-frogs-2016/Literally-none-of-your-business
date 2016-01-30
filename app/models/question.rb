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

# Question: <a href="/questions/<%=question.id%>/show"><%= question.text %></a>
#     <% if @survey.active? == 0 %>
#       <form action='/questions/<%=question.id%>' method='post'>
#         <input type='hidden' name='_method' value='delete'/>
#         <input type='submit' value='Delete this Question'/>
#       </form>
#       <a href="/questions/<%=question.id%>/edit">Edit this Question</a>
#     <% end %>
#     <% question.choices.each do |choice|%>
#       <li><%= choice.text%> </li>
#     <%end%>
