class ChangeDateToStoryDate < ActiveRecord::Migration[5.0]
  def change
    rename_column :stories, :date, :story_date
  end
end
