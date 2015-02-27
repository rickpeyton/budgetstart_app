class Expense < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  validates :name, :frequency, :amount, :user_id, :category_id, presence: true
end
