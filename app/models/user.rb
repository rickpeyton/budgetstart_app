class User < ActiveRecord::Base
  has_many :expenses
  has_many :categories
  accepts_nested_attributes_for :categories, allow_destroy: true
  has_secure_password validations: false
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :password, on: :create, presence: true, length: { minimum: 6 }
  validates :password, on: :update, allow_blank: true, length: { minimum: 6 }

  def getting_started
    # Create 5 Starter Categories
    starter_cats = %w(Insurance\ Premiums Vacations Car\ Repairs Tech\ Upgrades Gifts)
    starter_cats.each do |cat|
      self.categories.create(name: cat)
    end

    # Inject an expense into each category
    self.categories.
      find_by(name: 'Insurance Premiums').
      expenses.create(name: 'Auto Insurance', amount: 600, frequency_id: 5, user_id: self.id)
    self.categories.
      find_by(name: 'Insurance Premiums').
      expenses.create(name: 'Life Insurance', amount: 480, frequency_id: 2, user_id: self.id)
    self.categories.
      find_by(name: 'Vacations').
      expenses.create(name: 'Visit the in-laws', amount: 750, frequency_id: 2, user_id: self.id)
    self.categories.
      find_by(name: 'Car Repairs').
      expenses.create(name: 'New Tires', amount: 500, frequency_id: 7, user_id: self.id)
    self.categories.
      find_by(name: 'Tech Upgrades').
      expenses.create(name: 'New Macbook', amount: 1500, frequency_id: 8, user_id: self.id)
    self.categories.
      find_by(name: 'Tech Upgrades').
      expenses.create(name: 'New Smartphone', amount: 800, frequency_id: 7, user_id: self.id)
    self.categories.
      find_by(name: 'Gifts').
      expenses.create(name: 'Christmas', amount: 1000, frequency_id: 2, user_id: self.id)
    self.categories.
      find_by(name: 'Gifts').
      expenses.create(name: 'All Birthdays', amount: 400, frequency_id: 2, user_id: self.id)
  end
end
