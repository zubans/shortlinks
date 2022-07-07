require "rails_helper"

RSpec.describe UrlsController, type: :routing do
  describe "routing" do
    it "routes to #urls" do
      expect(post: "/urls").to route_to("urls#index")
    end

    it "routes to #return_url" do
      expect(get: "/urls/abc").to route_to("urls#return_url", "short_url"=>"abc")
    end

    it "routes to #stats" do
      expect(get: "/urls/abc/stats").to route_to("urls#stats", "short_url"=>"abc")
    end
  end
end
