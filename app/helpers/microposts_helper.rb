module MicropostsHelper

  def getCreatedAtPost(post)
    if post.created_at > Time.now.beginning_of_day 
      "#{time_ago_in_words(post.created_at)} ago"
    elsif post.created_at > 1.year.ago
      post.created_at.strftime("%b %d") 
    else
      post.created_at.strftime("%b %d, %Y") 
    end
  end

end
