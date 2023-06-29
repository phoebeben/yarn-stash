class Yarn < ApplicationRecord
  belongs_to :user
  belongs_to :project, through: :assigned_yarn

  validates :name, presence: true
  validates :skein_count, presence: true
end
