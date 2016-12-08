class User < ActiveRecord::Base
  has_many :articles
end

class Article < ActiveRecord::Base
  belongs_to :user
end

class UserMailer < ActiveMailer::Base
  def account_canceled(user)
    @user = user
  end
end

class DestroyUserService
  def initialize(user)
    raise ArgumentError, "Invalid argument type #{user.class}" unless user.is_a?(User)
    @user = user
  end

  def perform!
    Article.where('user_id = ?', @user.id).update_all(user_id: 1)
    UserMailer.account_canceled(@user).deliver_later
    @user.destroy
  end
end
