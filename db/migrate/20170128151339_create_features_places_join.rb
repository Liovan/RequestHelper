class CreateFeaturesPlacesJoin < ActiveRecord::Migration[5.0]
  def change
    create_table :features_places,id:false do |t|
      t.belongs_to :place,index:true,foreign_key: true
      t.belongs_to :feature,index:true,foreign_key: true
    end
  end
end
