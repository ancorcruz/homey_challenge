require "rails_helper"

RSpec.feature "User creates a project" do
  scenario "they see the page for the created project" do
    project_name = "Homey challenge"
    project_status = "in_progress"

    visit root_path
    click_on "New project"
    fill_in "Name", with: project_name
    fill_in "Status", with: project_status
    click_on "Create Project"

    expect(page).to have_text project_name
    expect(page).to have_text project_status
  end
end
