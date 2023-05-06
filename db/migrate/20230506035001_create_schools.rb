class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.text :about_us
      t.text :contact_us
      t.timestamps
    end
  end
end
