class AddDescriptionToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :description, :string
  end
end
