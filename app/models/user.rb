class User < ActiveRecord::Base
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def image
    Base64.encode64(File.open(File.join(Rails.root, "/app/assets/images/cute.jpg")).read)
  end
end
