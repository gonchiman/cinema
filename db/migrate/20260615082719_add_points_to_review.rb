class AddPointsToReview < ActiveRecord::Migration[8.1]
  def change
    add_column :reviews, :points, :integer
  end
end
