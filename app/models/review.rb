class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :points,
            numericality: {
              only_integer: true,
              greater_than: 1,
              less_than: 5
            }
end
