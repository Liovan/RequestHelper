class CreateFeaturesPlacesJoin < ActiveRecord::Migration[5.0]
  def change
    create_table :features_places_joins do |t|
      t.belongs_to :place,index:true
      t.belongs_to :feature,index:true
    end
  end
end
