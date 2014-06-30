class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|

      t.timestamps
    end

    for i in 1..10 do 
      Category.create!(:name => "Category #{n}")
    end
  end
end
