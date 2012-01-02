class AddtlFeaturedInfoToPerspectives < ActiveRecord::Migration
  def self.up
    add_column :settings, :introduction, :string
    add_column :settings, :intro_price, :string
    add_column :settings, :link, :string
  end

  def self.down
    remove_column :settings, :introduction
    remove_column :settings, :intro_price
    remove_column :settings, :link
  end
end
