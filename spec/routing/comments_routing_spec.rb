require "rails_helper"

RSpec.describe CommentsController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(post: "/projects/1/comments").to route_to("comments#create", project_id: "1")
    end
  end
end
