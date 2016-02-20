class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :test
      t.string :st_name
      t.string :st_surname
      t.string :st_group
      t.text   :report

      t.timestamps null: false
    end
  end
end
