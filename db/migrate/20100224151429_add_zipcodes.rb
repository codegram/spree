class AddZipcodes < ActiveRecord::Migration
  def self.up
    create_table "zipcodes" do |t|
      t.string  "code"
      t.references :country
    end
  end

  def self.down
    drop_table "zipcodes"
  end
end
