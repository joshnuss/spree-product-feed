Spree::ProductsController.class_eval do
  respond_to :rss, :only => [:index]

  caches_page :index, :expires_in => 5.minutes, :if => Proc.new {|c| c.request.format.rss? }
end
