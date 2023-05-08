require "rails_helper"

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

  scenario "they see the status update history message" do
    freeze_time do
      previous_status = "in_progress"
      new_status = "completed"
      status_changed_at = Time.zone.now.strftime "%d %B %H:%M"

      project = FactoryBot.create :project, status: previous_status

      visit project_path(project)
      click_on "Edit this project"
      fill_in "Status", with: new_status
      click_on "Update Project"

      expect(page).to have_text "Status changed from #{previous_status} to #{new_status} at #{status_changed_at}"
    end
  end
end
