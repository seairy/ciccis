class Identity < ActiveRecord::Base
  belongs_to :conventioner
  belongs_to :title
end
