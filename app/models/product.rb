class Product < ActiveRecord::Base
	belongs_to :creater, :class_name => "User", :foreign_key => :user_id

	# Adding relation to many photos
	has_many :photos
	accepts_nested_attributes_for :photos, allow_destroy: true
	# auto-mapping to `photos_attribute` which has `_attribute` suffix in posted hash in product's controller?
	# in doc: The attribute writer is named after the association

	def editable_by?(user)
		user && user == creater
	end
end
