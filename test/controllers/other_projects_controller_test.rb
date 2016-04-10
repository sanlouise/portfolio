require 'test_helper'

class OtherProjectsControllerTest < ActionController::TestCase
  setup do
    @other_project = other_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:other_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create other_project" do
    assert_difference('OtherProject.count') do
      post :create, other_project: { description: @other_project.description, github: @other_project.github, image: @other_project.image, live_link: @other_project.live_link, points: @other_project.points, title: @other_project.title }
    end

    assert_redirected_to other_project_path(assigns(:other_project))
  end

  test "should show other_project" do
    get :show, id: @other_project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @other_project
    assert_response :success
  end

  test "should update other_project" do
    patch :update, id: @other_project, other_project: { description: @other_project.description, github: @other_project.github, image: @other_project.image, live_link: @other_project.live_link, points: @other_project.points, title: @other_project.title }
    assert_redirected_to other_project_path(assigns(:other_project))
  end

  test "should destroy other_project" do
    assert_difference('OtherProject.count', -1) do
      delete :destroy, id: @other_project
    end

    assert_redirected_to other_projects_path
  end
end
