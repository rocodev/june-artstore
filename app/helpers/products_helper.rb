module ProductsHelper

  def render_product_photo(photo)
    if photo.present? #產品是否有照片
      image_tag(photo.image.thumb.url)
    else
      "no pic"
    end
  end

end