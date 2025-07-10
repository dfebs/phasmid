require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  setup do
    @project = projects(:project_one)
  end

  test "visiting the index" do
    sign_in_as users(:user_one)
    assert_selector "h1", text: "Projects"
  end

  test "should create project" do
    sign_in_as users(:user_one)
    click_on "New project"

    fill_in "Title", with: @project.title
    fill_in "Description", with: @project.description
    click_on "Create Project"

    assert_text "Project was successfully created"
  end

  test "should update Project" do
    sign_in_as users(:user_one)
    click_on @project.title, match: :first
    click_on "Edit this project", match: :first

    fill_in "Title", with: @project.title
    fill_in "Description", with: @project.description
    click_on "Update Project"

    assert_text "Project was successfully updated"
  end

  test "should destroy Project" do
    sign_in_as users(:user_one)
    click_on @project.title, match: :first
    click_on "Destroy this project", match: :first

    assert_text "Project was successfully destroyed"
  end
end
