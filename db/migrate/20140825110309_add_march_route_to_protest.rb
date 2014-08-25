class AddMarchRouteToProtest < ActiveRecord::Migration
  def change
    add_column :protests, :march_route, :string
  end
end
