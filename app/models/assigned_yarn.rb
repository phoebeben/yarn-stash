class AssignedYarn < ApplicationRecord
  belongs_to :project
  belongs_to :yarn

  validates :quantity, presence: true
end
