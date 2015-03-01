class Expense < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :frequency
  validates :name, :amount, :user_id, :category_id,
            :frequency_id, presence: true

end
