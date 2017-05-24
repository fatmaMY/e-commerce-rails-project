class User < ApplicationRecord
	validates :password, confirmation: true
	validates :first_name, presence: true, format: { without: /[0-9]/, message: "does not allow numbers" }
	validates :last_name, presence: true, format: { without: /[0-9]/, message: "does not allow numbers" }
	validates :email,
            presence: true,
            uniqueness: true,
            format: {
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
            }
	validates :password, length: { in: 6..20 }
    
    has_secure_password
    has_many :charges
     has_many :cart_items
     has_many :carts


   def to_s
    "#{first_name} #{last_name}"
  end

  def gather_transactions
  	# create a list of a specific user's transactions to print to the view
  	User.transactions
  end
  def transations_count
  	self.transactions.count
  end
end
