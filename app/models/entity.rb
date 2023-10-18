class Entity < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  validates :name, presence: true
  validates :amount, presence: true
end
