class Category < ActiveRecord::Base
  belongs_to :user
  has_many :expenses
  validates :name, :user_id, presence: true
end
