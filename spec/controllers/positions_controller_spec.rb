require 'spec_helper'

describe PositionsController do

  def mock_position(stubs={})
    @mock_position ||= mock_model(Position, stubs)
  end

  def mock_committee(stubs={})
    @mock_committee ||= mock_model(Committee, stubs)
  end

  def mock_child(stubs={})
    @mock_child ||= mock_model(Position, stubs)
  end

  def mock_role(stubs={})
    @mock_role ||= mock_model(Role, stubs)
  end

  before(:each) do
    #TODO spec login
    @user = Factory(:user)
    controller.stub!(:current_user).and_return @user

    User.stub(:find).and_return(@user)
    @user.stub!(:positions).and_return(mock_child)
    Committee.stub(:all).and_return([mock_committee])
    mock_committee.stub(:roles).and_return([mock_role])
    SystemParameter.stub(:find_by_code).with("year_founded").and_return(
      mock_model(SystemParameter, :value => 2000 ))
    mock_position.stub(:user).and_return(@user)
    mock_position.stub(:committee).and_return(mock_committee)
  end

  describe "GET new" do
    it "assigns a new position as @position" do
      mock_child.stub(:build).and_return(mock_position)
      get :new, :user_id => "1"
      assigns[:position].should equal(mock_position)
    end
  end

  describe "GET edit" do
    it "assigns the requested position as @position" do
      Position.stub(:find).with("37").and_return(mock_position)
      get :edit, :id => "37", :user_id => "1"
      assigns[:position].should equal(mock_position)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created position as @position" do
        mock_child.stub(:build).with({'these' => 'params'}).and_return(mock_position)
        mock_position.stub(:save).and_return(true)
        post :create, :position => {:these => 'params'}, :user_id => "1"
        assigns[:position].should equal(mock_position)
      end

      it "redirects to the created position" do
        mock_child.stub(:build).and_return(mock_position)
        mock_position.stub(:save).and_return(true)
        post :create, :position => {}, :user_id => 1
        response.should redirect_to(user_url(@user))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved position as @position" do
        mock_child.stub(:build).with({'these' => 'params'}).and_return(mock_position)
        mock_position.stub(:save).and_return(false)
        post :create, :position => {:these => 'params'}
        assigns[:position].should equal(mock_position)
      end

      it "re-renders the 'new' template" do
        mock_child.stub(:build).and_return(mock_position)
        mock_position.stub(:save).and_return(false)
        post :create, :position => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested position" do
        Position.should_receive(:find).with("37").and_return(mock_position)
        mock_position.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :position => {:these => 'params'}
      end

      it "assigns the requested position as @position" do
        Position.stub(:find).and_return(mock_position)
        mock_position.stub(:update_attributes).and_return(true)
        put :update, :id => "1", :user_id => 1
        assigns[:position].should equal(mock_position)
      end

      it "redirects to the position" do
        Position.stub(:find).and_return(mock_position)
        mock_position.stub(:update_attributes).and_return(true)
        put :update, :id => "1", :user_id => 1
        response.should redirect_to(user_url(@user))
      end
    end

    describe "with invalid params" do
      it "updates the requested position" do
        Position.should_receive(:find).with("37").and_return(mock_position)
        mock_position.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :position => {:these => 'params'}
      end

      it "assigns the position as @position" do
        Position.stub(:find).and_return(mock_position)
        mock_position.stub(:update_attributes).and_return(false)
        put :update, :id => "1", :user_id => 1, :position => {}
        assigns[:position].should equal(mock_position)
      end

      it "re-renders the 'edit' template" do
        Position.stub(:find).and_return(mock_position)
        mock_position.stub(:update_attributes).and_return(false)
        put :update, :id => "1", :user_id => 1, :position => {}
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested position" do
      Position.should_receive(:find).with("37").and_return(mock_position)
      mock_position.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the positions list" do
      Position.stub(:find).and_return(mock_position)
      mock_position.stub(:destroy).and_return(true)
      delete :destroy, :id => "1"
      response.should redirect_to(user_url(@user))
    end
  end

end
