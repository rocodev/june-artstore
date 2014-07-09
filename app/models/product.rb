class Product < ActiveRecord::Base
	has_many :photos, :dependent => :delete_all
end
