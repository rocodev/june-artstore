class CreateConcernsTokenables < ActiveRecord::Migration
  def change
    create_table :concerns_tokenables do |t|

      t.timestamps
    end
  end
end
