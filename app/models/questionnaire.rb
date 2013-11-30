class Questionnaire < ActiveRecord::Base
  validates_presence_of :name, :mobile, :city, :organization, :will_participate_at
end
