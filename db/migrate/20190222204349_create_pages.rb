class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :color
      t.string :ip_address
      t.timestamps
    end
  end
end
