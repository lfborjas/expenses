class Expense < ActiveRecord::Base
  attr_accessible :balance_after, :balance_before, :detail, :quantity, :user_id
  belongs_to :user
end
