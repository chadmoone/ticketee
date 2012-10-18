require 'spec_helper'

describe ProjectsController do

  let!(:user) { Factory(:confirmed_user) }

  context "standard users" do
    let!(:project) { mock_model(Project, :id => 1) }

    {:new => :get,
     :create => :post,
     :edit => :get,
     :update => :put,
     :destroy => :delete}.each do |action, method|
    it "cannot access the #{action} action" do
        sign_in(:user, user)
        send(method, action, :id => project.id)
        response.should redirect_to(root_path)
        flash[:alert].should == "You must be an admin to do that."
      end
    end
  end

	it "displays an error for a missing project" do
		get :show, :id => "not-here"
		response.should redirect_to(projects_path)
		message = "The project you were looking for could not be found."
		flash[:alert].should == message
	end


end
