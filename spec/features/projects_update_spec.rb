require 'rails_helper'

RSpec.feature "User updates a project" do
  scenario "they see the page for the updated project" do
    project_name = "Homey challenge"
    project_status = "completed"

    project = FactoryBot.create :project

    visit project_path(project)
    click_on "Edit this project"
    fill_in "Name", with: project_name
    fill_in "Status", with: project_status
    click_on "Update Project"

    expect(page).to have_text project_name
    expect(page).to have_text project_status
  end
end
