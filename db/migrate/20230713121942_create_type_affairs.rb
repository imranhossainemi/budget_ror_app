class CreateTypeAffairs < ActiveRecord::Migration[7.0]
  def change
    create_table :type_affairs do |t|
      t.references :budget_affair, null: false, foreign_key: true
      t.references :budget_type, null: false, foreign_key: true 
      
      t.timestamps
    end
  end
end
