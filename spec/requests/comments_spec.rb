require "rails_helper"

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/project/:id/comments", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Comment. As you add validations to Comment, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "POST /create" do
    let(:project) { FactoryBot.create :project }

    context "with valid parameters" do
      it "creates a new Comment" do
        expect {
          post project_comments_url(project), params: {comment: valid_attributes}
        }.to change(Comment, :count).by(1)
      end

      it "redirects to the created comment" do
        post project_comments_url(project), params: {comment: valid_attributes}
        expect(response).to redirect_to(comment_url(Comment.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Comment" do
        expect {
          post project_comments_url(project), params: {comment: invalid_attributes}
        }.to change(Comment, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post project_comments_url(project), params: {comment: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
