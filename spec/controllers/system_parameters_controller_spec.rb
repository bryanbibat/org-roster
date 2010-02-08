require 'spec_helper'

describe SystemParametersController do

  def mock_system_parameter(stubs={})
    @mock_system_parameter ||= mock_model(SystemParameter, stubs)
  end

  describe "GET index" do
    it "assigns all system_parameters as @system_parameters" do
      SystemParameter.stub(:find).with(:all).and_return([mock_system_parameter])
      get :index
      assigns[:system_parameters].should == [mock_system_parameter]
    end
  end

  describe "GET show" do
    it "assigns the requested system_parameter as @system_parameter" do
      SystemParameter.stub(:find).with("37").and_return(mock_system_parameter)
      get :show, :id => "37"
      assigns[:system_parameter].should equal(mock_system_parameter)
    end
  end

  describe "GET new" do
    it "assigns a new system_parameter as @system_parameter" do
      SystemParameter.stub(:new).and_return(mock_system_parameter)
      get :new
      assigns[:system_parameter].should equal(mock_system_parameter)
    end
  end

  describe "GET edit" do
    it "assigns the requested system_parameter as @system_parameter" do
      SystemParameter.stub(:find).with("37").and_return(mock_system_parameter)
      get :edit, :id => "37"
      assigns[:system_parameter].should equal(mock_system_parameter)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created system_parameter as @system_parameter" do
        SystemParameter.stub(:new).with({'these' => 'params'}).and_return(mock_system_parameter(:save => true))
        post :create, :system_parameter => {:these => 'params'}
        assigns[:system_parameter].should equal(mock_system_parameter)
      end

      it "redirects to the created system_parameter" do
        SystemParameter.stub(:new).and_return(mock_system_parameter(:save => true))
        post :create, :system_parameter => {}
        response.should redirect_to(system_parameter_url(mock_system_parameter))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved system_parameter as @system_parameter" do
        SystemParameter.stub(:new).with({'these' => 'params'}).and_return(mock_system_parameter(:save => false))
        post :create, :system_parameter => {:these => 'params'}
        assigns[:system_parameter].should equal(mock_system_parameter)
      end

      it "re-renders the 'new' template" do
        SystemParameter.stub(:new).and_return(mock_system_parameter(:save => false))
        post :create, :system_parameter => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested system_parameter" do
        SystemParameter.should_receive(:find).with("37").and_return(mock_system_parameter)
        mock_system_parameter.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :system_parameter => {:these => 'params'}
      end

      it "assigns the requested system_parameter as @system_parameter" do
        SystemParameter.stub(:find).and_return(mock_system_parameter(:update_attributes => true))
        put :update, :id => "1"
        assigns[:system_parameter].should equal(mock_system_parameter)
      end

      it "redirects to the system_parameter" do
        SystemParameter.stub(:find).and_return(mock_system_parameter(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(system_parameter_url(mock_system_parameter))
      end
    end

    describe "with invalid params" do
      it "updates the requested system_parameter" do
        SystemParameter.should_receive(:find).with("37").and_return(mock_system_parameter)
        mock_system_parameter.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :system_parameter => {:these => 'params'}
      end

      it "assigns the system_parameter as @system_parameter" do
        SystemParameter.stub(:find).and_return(mock_system_parameter(:update_attributes => false))
        put :update, :id => "1"
        assigns[:system_parameter].should equal(mock_system_parameter)
      end

      it "re-renders the 'edit' template" do
        SystemParameter.stub(:find).and_return(mock_system_parameter(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested system_parameter" do
      SystemParameter.should_receive(:find).with("37").and_return(mock_system_parameter)
      mock_system_parameter.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the system_parameters list" do
      SystemParameter.stub(:find).and_return(mock_system_parameter(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(system_parameters_url)
    end
  end

end
