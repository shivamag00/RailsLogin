class Student < ApplicationRecord
  validates :name, presence: true
  validates :sem, presence: true
  validates :gender, presence: true
  validates :address, presence: true
  validates :password, presence: true

end
