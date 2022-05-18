class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :category, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"] }
  validates :address, :name, presence: true
end
