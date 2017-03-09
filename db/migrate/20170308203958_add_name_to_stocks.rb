class AddNameToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :name, :string, :after => :ticker
  end
end
