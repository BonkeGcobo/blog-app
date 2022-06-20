class ApplicationController < ActionController::Base
  def current_user
    User.first
  end

  def all_users
    User.all
  end

  def recent_posts(id)
    user = User.find_by(id:)
    user.first_three_posts
  end
end
