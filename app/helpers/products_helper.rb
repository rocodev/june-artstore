module ProductsHelper

  def render_product_name(product)
    product.title
  end

  def render_product_desc(product)
    simple_format(product.description)
  end

  def render_product_quantity(product)
    product.quantity
  end

  def render_product_price(product)
    product.price
  end

end
