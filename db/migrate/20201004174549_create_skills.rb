class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.text :name

      t.timestamps
    end
  end
end
