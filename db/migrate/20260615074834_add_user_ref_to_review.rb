class AddUserRefToReview < ActiveRecord::Migration[8.1]
  def change
    add_reference :reviews, :user, null: true, foreign_key: true
  end
end
