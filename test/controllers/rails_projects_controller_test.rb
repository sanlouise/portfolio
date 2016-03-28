require 'test_helper'

class RailsProjectsControllerTest < ActionController::TestCase
  setup do
    @rails_project = rails_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rails_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rails_project" do
    assert_difference('RailsProject.count') do
      post :create, rails_project: { description: @rails_project.description, github: @rails_project.github, image: @rails_project.image, live_link: @rails_project.live_link, points: @rails_project.points, title: @rails_project.title }
    end

    assert_redirected_to rails_project_path(assigns(:rails_project))
  end

  test "should show rails_project" do
    get :show, id: @rails_project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rails_project
    assert_response :success
  end

  test "should update rails_project" do
    patch :update, id: @rails_project, rails_project: { description: @rails_project.description, github: @rails_project.github, image: @rails_project.image, live_link: @rails_project.live_link, points: @rails_project.points, title: @rails_project.title }
    assert_redirected_to rails_project_path(assigns(:rails_project))
  end

  test "should destroy rails_project" do
    assert_difference('RailsProject.count', -1) do
      delete :destroy, id: @rails_project
    end

    assert_redirected_to rails_projects_path
  end
end
