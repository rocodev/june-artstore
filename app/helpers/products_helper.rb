module ProductsHelper
  def render_photo(photo)
    image_tag(photo.image.url) if photo.present?
  end
end
