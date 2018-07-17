class PreRegistration < ApplicationRecord
  belongs_to :client
  belongs_to :schedule_course
end
