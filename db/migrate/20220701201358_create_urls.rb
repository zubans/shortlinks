class CreateUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :urls do |t|
      t.string :long_url, :null => false
      t.string :short_url, index: { unique: true, name: "unique_short_url" }
      t.integer :count, :default => 0
      t.timestamps
    end
  end
end
