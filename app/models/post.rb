class Post < ActiveRecord::Base
  belongs_to :user

  validates :image, :description, :amount_expected, presence: true

  default_scope { where(status: true).order(created_at: :desc) }

  before_save :convert_to_coins

  def convert_to_coins
    self.amount_expected /= 10
  end
end
