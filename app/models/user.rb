class User < ActiveRecord::Base
  ROLE_ADMIN, ROLE_LEADER, ROLE_EMPLOYEE, ROLE_VOLUNTEER = 1, 2, 3, 4
  attr_accessor :password
  before_create :generate_hashed_password
  validates_presence_of :account, :password, :password_confirmation, :on => :create
  validates_length_of :account, :password, :password_confirmation,:in => 4..16, :on => :create
  validates_uniqueness_of :account, :on => :create
  validates_confirmation_of :password, :on => :create
  scope :employees_and_volunteers, where('role IN ?', [ROLE_EMPLOYEE, ROLE_VOLUNTEER])
  scope :volunteers, where(role:ROLE_VOLUNTEER)
  
  def generate_hashed_password
    self.hashed_password = Digest::MD5.hexdigest self.password
  end
  
  class << self
    def signin account, password
      self.find_by_account_and_hashed_password account, Digest::MD5.hexdigest(password)
    end
  end
end
