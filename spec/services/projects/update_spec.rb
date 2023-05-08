require "rails_helper"

RSpec.describe Projects::Update, type: :service do
  describe ".call" do
    subject(:result) do
      described_class.call(project: project, project_params: project_params)
    end

    let(:project) { FactoryBot.create :project }
    let(:project_params) { {name: project_name} }
    let(:project_name) { "new name" }

    it { is_expected.to eq true }

    it "updates project attributes" do
      expect { result }.to change { project.name }.to(project_name)
    end

    it "does not create an status change" do
      expect { result }.not_to change { project.status_changes.size }
    end

    context "when project is not updated" do
      let(:project_name) { nil }

      it { is_expected.to eq(false) }
    end

    context "when project status is updated" do
      let(:project_params) { {name: "new name", status: "completed"} }

      it { is_expected.to eq true }

      it "updates project attributes" do
        expect { result }.to change { project.name }.to(project_name)
      end

      it "creates an status change for the project" do
        freeze_time do
          expect { result }.to change { project.status_changes.size }.by(1)
          expect(project.status_changes.first).to have_attributes(
            previous_status: "in_progress",
            new_status: "completed",
            created_at: Time.zone.now
          )
        end
      end
    end

    context "when status_changes creation fails" do
      let(:project_params) { {name: "new name", status: "completed"} }
      let(:status_changes) { double("status_changes_collection") }

      before do
        allow(project).to receive(:status_changes).and_return(status_changes)
        allow(status_changes).to receive(:create!).and_raise(StandardError)
      end

      it { is_expected.to eq false }

      it "does not update project attributes" do
        expect { result }.not_to change { project.reload.name }
      end
    end
  end
end
