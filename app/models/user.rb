class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :protests

  def my_protests(params) #params will be passed in through controller
		    protests.paginate(page: params[:page], order: 'created_at DESC', per_page: 10)
		    #calling this method on a user object so can go through its questions association - scopes questions returned to only return questions that belong to user method is called on
  end
  def self.all_users(params)
     all().paginate(page: params[:page], order: 'created_at DESC', per_page: 12)

  end
end
