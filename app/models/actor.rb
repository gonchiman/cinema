class Actor < ApplicationRecord
  validates :name, :birth_date, :height, :gender, presence: true

  validates :height,
            numericality: {
              only_integer: true,
              greater_than: 50,
              less_than: 300
            }

  validates :weight,
            numericality: {
              greater_than: 20,
              less_than: 300
            },
            allow_blank: true

  validates :gender,
            inclusion: {
              in: ["male", "female"]
            }

  validates :blood_type,
            inclusion: {
              in: ["A", "B", "O", "AB"]
            },
            allow_blank: true
end
