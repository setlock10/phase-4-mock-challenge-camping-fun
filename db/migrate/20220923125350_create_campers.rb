class CreateCampers < ActiveRecord::Migration[6.1]
  def change
    create_table :campers do |t|
      t.string    :name, null: false
      t.integer   :age, inclusion: 8..18

      t.timestamps
    end
  end
end
