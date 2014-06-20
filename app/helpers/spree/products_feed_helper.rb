module Spree::ProductsFeedHelper
  def current_store_title
    Spree::Store.current(request.server_name).name
  end

  def current_store_link
    request.url
  end

  def current_store_description
    "Find out about new products first! You'll always be in the know when new products become available"
  end

  def product_description product
    image = image_tag(product.images.first.attachment.url(:product))
    product_link = product.images && link_to(image, product_url(product))

    "<![CDATA[#{product_link}#{simple_format(product.description)}]]>"
  end

  def product_image_link path
    URI.join(request.url, path)
  end

  def product_price amount
    number_to_currency(amount, unit: 'USD', format: "%n %u")
  end
end
