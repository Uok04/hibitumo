class ChangeColumnsToUsers < ActiveRecord::Migration[7.0]
  def up
    User.where(position: nil).update_all(position: '')
    User.where(affiliation: nil).update_all(affiliation: '')
    change_column :users, :position, :string, default: '', null: false
    change_column :users, :affiliation, :string, default: '', null: false
  end

  def down
    change_column :users, :position, :string, default: nil, null: true
    change_column :users, :affiliation, :string, default: nil, null: true
  end
end
