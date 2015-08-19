class User < ActiveRecord::Base
  has_secure_password

  validates_uniqueness_of :username
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true

  has_many :accounts
  has_many :orders, through: :accounts

  def full_name
    self.first_name+" "+self.last_name
  end
end
