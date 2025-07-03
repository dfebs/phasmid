require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:project_one)
  end

  test "should get index" do
    post session_url(email_address: users(:user_one).email_address, password: "420SirPassingtonXIV_WEOUTHERE")
    get projects_url
    assert_response :success
  end

  test "should get new" do
    post session_url(email_address: users(:user_one).email_address, password: "420SirPassingtonXIV_WEOUTHERE")
    get new_project_url
    assert_response :success
  end

  test "should create project" do
    post session_url(email_address: users(:user_one).email_address, password: "420SirPassingtonXIV_WEOUTHERE")
    assert_difference("Project.count") do
      post projects_url, params: { project: { description: @project.description, title: @project.title } }
    end

    assert_redirected_to project_url(Project.last)
  end

  test "should show project" do
    post session_url(email_address: users(:user_one).email_address, password: "420SirPassingtonXIV_WEOUTHERE")
    get project_url(@project)
    assert_response :success
  end

  test "should get edit" do
    post session_url(email_address: users(:user_one).email_address, password: "420SirPassingtonXIV_WEOUTHERE")
    get edit_project_url(@project)
    assert_response :success
  end

  test "should update project" do
    post session_url(email_address: users(:user_one).email_address, password: "420SirPassingtonXIV_WEOUTHERE")
    patch project_url(@project), params: { project: { description: @project.description, title: @project.title } }
    assert_redirected_to project_url(@project)
  end

  test "should destroy project" do
    post session_url(email_address: users(:user_one).email_address, password: "420SirPassingtonXIV_WEOUTHERE")
    assert_difference("Project.count", -1) do
      delete project_url(@project)
    end

    assert_redirected_to projects_url
  end
end
