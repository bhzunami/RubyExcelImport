class CreateTricks < ActiveRecord::Migration
  def change
    create_table :tricks do |t|
      t.string :title
      t.text :problem
      t.text :solution
      t.string :author
      t.string :solved_by

      t.timestamps
    end
  end
end
