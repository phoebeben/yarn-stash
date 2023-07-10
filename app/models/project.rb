class Project < ApplicationRecord
  belongs_to :user
  has_many :yarns
  has_many :assigned_yarns
end
