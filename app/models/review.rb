class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :points,
            numericality: {
              only_integer: true,
              greater_than: 0,
              less_than: 6
            }

  validates :user, presence: true
end
