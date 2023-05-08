require "rails_helper"

RSpec.feature "User adds a comment to a project" do
  scenario "they see the comment" do
    comment = "This is project almost done!"
    project = FactoryBot.create :project

    visit project_path(project)
    fill_in "Comment", with: comment
    click_on "Create Comment"

    expect(page).to have_text comment
  end
end
