class Yarn < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :skein_count, presence: true
end
