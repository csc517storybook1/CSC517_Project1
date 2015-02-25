class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.text :Title
      t.text :Description
      t.integer :user_id

      t.timestamps null: false

    end
  end
end
