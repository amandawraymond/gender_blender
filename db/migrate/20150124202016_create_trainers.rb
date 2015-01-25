class CreateTrainers < ActiveRecord::Migration
  def change
    create_table :trainers do |t|
      t.string :gender
      t.decimal :weight
      t.decimal :height

      t.timestamps
    end
  end
end
