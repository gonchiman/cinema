class MakeReviewPointsAndUserMandatory < ActiveRecord::Migration[8.1]
  def change
    change_column_null :reviews, :points, false
    change_column_null :reviews, :user_id, false
  end
end