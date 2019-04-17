class ShiftJob < ApplicationRecord
  belongs_to :Job
  belongs_to :Shift
end
