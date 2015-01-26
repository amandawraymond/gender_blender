class CreateContestants < ActiveRecord::Migration
  def change
    create_table :contestants do |t|
      t.string :name
      t.decimal :height
      t.decimal :weight

      t.timestamps
    end
  end
end
