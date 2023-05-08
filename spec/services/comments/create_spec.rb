require "rails_helper"

RSpec.describe Comments::Create, type: :service do
  describe ".call" do
    subject(:result) do
      described_class.call(project: project, comment_params: comment_params)
    end

    let(:project) { FactoryBot.create :project }
    let(:comment_params) { {body: comment_body} }
    let(:comment_body) { "Should the project be cancelled?" }

    it { is_expected.to eq true }

    it "creates a comment for the project" do
      expect { result }.to change { project.comments.size }.by(1)
      expect(project.comments.first).to have_attributes(body: comment_body)
    end

    it "creates an activity record" do
      expect { result }.to change { project.activities.size }.by(1)
      expect(project.activities.first.trackable).to eq(project.comments.first)
    end

    context "when comment is not created" do
      let(:comment_body) { nil }

      it { is_expected.to eq false }

      it "does not create an activity record" do
        expect { result }.not_to change { project.comments.reload.size }
      end
    end

    context "when activity creation fails" do
      let(:activities_collection) { double("activities_collection") }

      before do
        allow(project).to receive(:activities).and_return(activities_collection)
        allow(activities_collection).to receive(:create!).and_raise(StandardError)
      end

      it { is_expected.to eq false }

      it "does not create comment" do
        expect { result }.not_to change { project.comments.reload.size }
      end
    end
  end
end
