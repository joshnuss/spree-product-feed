require 'spec_helper'

describe Spree::ProductsController do
  context "GET /index" do
    before { get :index, :format => 'rss', :use_route => :spree }

    specify { response.should be_success }
    specify { response.content_type.should == 'application/rss+xml' }
  end
end
