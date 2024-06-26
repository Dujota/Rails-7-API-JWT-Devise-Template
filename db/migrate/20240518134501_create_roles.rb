class CreateRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :roles do |t|
      t.string :name

      t.timestamps
    end

    create_table :roles_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :role
    end
  end
end
