require "rails_helper"

RSpec.feature "User views project activity feed" do
  scenario "they see comments and status changes" do
    project = FactoryBot.create :project

    old_comment = FactoryBot.create :comment, project: project, body: "old comment"
    FactoryBot.create :activity, project: project, trackable: old_comment

    status_change = FactoryBot.create :status_change, project: project
    FactoryBot.create :activity, project: project, trackable: status_change

    new_comment = FactoryBot.create :comment, project: project, body: "new comment"
    FactoryBot.create :activity, project: project, trackable: new_comment

    visit project_path(project)

    activities = all("#activity_feed>div")
    expect(activities[0]).to have_text "new comment"
    expect(activities[1]).to have_text "Status changed"
    expect(activities[2]).to have_text "old comment"
  end
end
