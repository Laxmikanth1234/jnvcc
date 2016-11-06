class AddAvatarsToEvents < ActiveRecord::Migration[5.0]
  def self.up
    change_table :events do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :events, :avatar
  end
end
