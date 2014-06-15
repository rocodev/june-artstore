module ProductsHelper
  def render_photo(photo)
    image_tag(photo.image.thumb.url) if photo.present?
  end
end
