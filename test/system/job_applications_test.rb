require "application_system_test_case"

class JobApplicationsTest < ApplicationSystemTestCase
  setup do
    @job_application = job_applications(:one)
  end

  test "visiting the index" do
    visit job_applications_url
    assert_selector "h1", text: "Job Applications"
  end

  test "creating a Job application" do
    visit job_applications_url
    click_on "New Job Application"

    fill_in "Email", with: @job_application.email
    fill_in "First name", with: @job_application.first_name
    fill_in "Job", with: @job_application.job_id
    fill_in "Last name", with: @job_application.last_name
    click_on "Create Job application"

    assert_text "Job application was successfully created"
    click_on "Back"
  end

  test "updating a Job application" do
    visit job_applications_url
    click_on "Edit", match: :first

    fill_in "Email", with: @job_application.email
    fill_in "First name", with: @job_application.first_name
    fill_in "Job", with: @job_application.job_id
    fill_in "Last name", with: @job_application.last_name
    click_on "Update Job application"

    assert_text "Job application was successfully updated"
    click_on "Back"
  end

  test "destroying a Job application" do
    visit job_applications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Job application was successfully destroyed"
  end
end
