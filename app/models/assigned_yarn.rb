class AssignedYarn < ApplicationRecord
  belongs_to :project
  belongs_to :yarn
end
