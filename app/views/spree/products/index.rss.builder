xml.instruct! :xml, :version=>"1.0" 
xml.rss(:version=>"2.0", "xmlns:g" => "http://base.google.com/ns/1.0"){
  xml.channel{
    xml.title("#{Spree::Config[:site_name]}")
    xml.link("http://#{Spree::Config[:site_url]}")
    xml.description("Find out about new products first! You'll always be in the know when new products become available")
    xml.language('en-us')
    @products.each do |product|
      title = "#{product.brand.nil? ? '' : product.brand.name} #{product.name}"
      product_type = ''
      product_type = (product.taxons.first.ancestors.map{|t| t.name} << product.taxons.first.name).join(" > ") if product.taxons.any?

      total_product_images = product.images.count

      xml.item do
        xml.title(title)
        xml.description((total_product_images > 0 ? link_to(image_tag(product.images.first.attachment.url(:product)), product_url(product)) : '') + simple_format(product.description))
        xml.author(Spree::Config[:site_url])               
        xml.pubDate((product.available_on || product.created_at).strftime("%a, %d %b %Y %H:%M:%S %z"))
        xml.link(product_url(product))
        xml.guid(product.id)
        xml.sku(product.sku.to_s.strip)
        xml.vendor_sku(product.vendor_sku.to_s.strip)
        xml.weight(product.weight)
        xml.shipping_weight(product.shipping_weight.to_f)

        xml.vendor(product.vendor.present? ? product.vendor.name : '')

        xml.tag!('g:image_link', total_product_images > 0 ? product.images.first.attachment.url(:large) : '')

        xml.tag!('g:price', product.price)
        xml.tag!('g:condition', 'new')
        xml.tag!('g:id', product.id)
        xml.tag!('g:availability', product.count_on_hand > 0 ? 'in stock' : 'out of stock')
        xml.tag!('g:brand', product.brand.to_s)
        xml.tag!('g:product_type', product_type)

        if product.upc.nil? 
          xml.tag!('g:identifier_exists', 'FALSE')
        else 
          xml.tag!('g:gtin', product.upc)
        end
      end
    end
  }
}
