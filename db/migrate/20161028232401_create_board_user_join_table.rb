class CreateBoardUserJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :boards, :users do |t|
      t.references :board, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
