class ChangeTypeColumnMaghtaToStudent < ActiveRecord::Migration[5.0]
  def change
    change_column :students,:maghta, 'integer USING CAST(maghta AS integer)'
  end
end
