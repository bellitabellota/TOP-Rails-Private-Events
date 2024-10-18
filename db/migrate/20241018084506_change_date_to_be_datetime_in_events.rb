class ChangeDateToBeDatetimeInEvents < ActiveRecord::Migration[7.2]
  def up
    change_column :events, :date, :datetime
  end

  def down
    change_column :events, :date, :string
  end
end
