class DeleteColumnInterestToCategories < ActiveRecord::Migration[6.1]
  def change
    remove_column :categories, :interest_id
  end
end
