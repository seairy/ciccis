class Operation < ActiveRecord::Base
  ACTION_UPDATE, ACTION_REGISTER = 1, 2
  belongs_to :user
  belongs_to :conventioner
end
