require 'test_helper'

class IosProjectsControllerTest < ActionController::TestCase
  setup do
    @ios_project = ios_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ios_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ios_project" do
    assert_difference('IosProject.count') do
      post :create, ios_project: { description: @ios_project.description, github: @ios_project.github, image: @ios_project.image, live_link: @ios_project.live_link, points: @ios_project.points, title: @ios_project.title }
    end

    assert_redirected_to ios_project_path(assigns(:ios_project))
  end

  test "should show ios_project" do
    get :show, id: @ios_project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ios_project
    assert_response :success
  end

  test "should update ios_project" do
    patch :update, id: @ios_project, ios_project: { description: @ios_project.description, github: @ios_project.github, image: @ios_project.image, live_link: @ios_project.live_link, points: @ios_project.points, title: @ios_project.title }
    assert_redirected_to ios_project_path(assigns(:ios_project))
  end

  test "should destroy ios_project" do
    assert_difference('IosProject.count', -1) do
      delete :destroy, id: @ios_project
    end

    assert_redirected_to ios_projects_path
  end
end
