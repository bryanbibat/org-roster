require 'spec_helper'

describe RolesController do

  def mock_role(stubs={})
    @mock_role ||= mock_model(Role, stubs)
  end

  def mock_child(stubs={})
    @mock_child ||= mock_model(Role, stubs)
  end


  def mock_committee(stubs={})
    @mock_committee ||= mock_model(Committee, stubs)
  end

  #TODO test admin role


  before(:each) do
    @user = Factory(:user, :role => "A")
    controller.stub!(:current_user).and_return @user
  end

  describe "GET new" do
    it "assigns a new role as @role" do
      Committee.stub(:find).and_return(mock_committee)
      mock_committee.should_receive(:roles).and_return(mock_model(Role, :build => mock_role ))
      get :new, :committee_id => "1"
      assigns[:role].should equal(mock_role)
    end
  end

  describe "GET edit" do
    it "assigns the requested role as @role" do
      Role.stub(:find).with("37").and_return(mock_role)
      mock_role.should_receive(:committee).and_return(mock_committee)
      get :edit, :id => "37", :committee_id => "1"
      assigns[:role].should equal(mock_role)
      assigns[:committee].should equal(mock_committee)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created role as @role" do
        Committee.stub(:find).and_return(mock_committee)
        mock_committee.should_receive(:roles).and_return(mock_child)
        mock_child.stub(:build).with({'these' => 'params'}).and_return(mock_role(:save => true))
        post :create, :role => {:these => 'params'}, :committee_id => "1"
        assigns[:role].should equal(mock_role)
      end

      it "redirects to the created role" do
        Committee.stub(:find).and_return(mock_committee)
        mock_committee.should_receive(:roles).and_return(mock_child)
        mock_child.stub(:build).and_return(mock_role(:save => true))

        post :create, :role => {}, :committee_id => "1"
        response.should redirect_to(committee_url(mock_committee))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved role as @role" do
        Committee.stub(:find).and_return(mock_committee)
        mock_committee.should_receive(:roles).and_return(mock_child)
        mock_child.stub(:build).with({'these' => 'params'}).and_return(mock_role(:save => false))

        post :create, :role => {:these => 'params'}, :committee_id => "1"
        assigns[:role].should equal(mock_role)
      end

      it "re-renders the 'new' template" do
        Committee.stub(:find).and_return(mock_committee)
        mock_committee.should_receive(:roles).and_return(mock_child)
        mock_child.stub(:build).and_return(mock_role(:save => false))

        post :create, :role => {}, :committee_id => "1"
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested role" do
        Role.should_receive(:find).with("37").and_return(mock_role)
        mock_role.should_receive(:committee).and_return(mock_committee)
        mock_role.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :role => {:these => 'params'}, :committee_id => "1"
      end

      it "assigns the requested role as @role" do
        Role.stub(:find).and_return(mock_role(:update_attributes => true))
        mock_role.should_receive(:committee).and_return(mock_committee)
        put :update, :id => "1", :committee_id => "1"
        assigns[:role].should equal(mock_role)
      end

      it "redirects to the role" do
        Role.stub(:find).and_return(mock_role(:update_attributes => true))
        mock_role.should_receive(:committee).and_return(mock_committee)
        put :update, :id => "1", :committee_id => "1"
        response.should redirect_to(committee_url(mock_committee))
      end
    end

    describe "with invalid params" do
      it "updates the requested role" do
        Role.should_receive(:find).with("37").and_return(mock_role)
        mock_role.should_receive(:committee).and_return(mock_committee)
        mock_role.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :role => {:these => 'params'}, :committee_id => "1"
      end

      it "assigns the role as @role" do
        Role.stub(:find).and_return(mock_role(:update_attributes => false))
        mock_role.should_receive(:committee).and_return(mock_committee)
        put :update, :id => "1", :committee_id => "1"
        assigns[:role].should equal(mock_role)
      end

      it "re-renders the 'edit' template" do
        Role.stub(:find).and_return(mock_role(:update_attributes => false))
        mock_role.should_receive(:committee).and_return(mock_committee)
        put :update, :id => "1", :committee_id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested role" do
      Role.should_receive(:find).with("37").and_return(mock_role)
      mock_role.should_receive(:committee).and_return(mock_committee)
      mock_role.should_receive(:destroy)
      delete :destroy, :id => "37", :committee_id => "1"
    end

    it "redirects to the roles list" do
      Role.stub(:find).and_return(mock_role(:destroy => true))
      mock_role.should_receive(:committee).and_return(mock_committee)
      delete :destroy, :id => "1", :committee_id => "1"
      response.should redirect_to(committee_url(mock_committee))
    end
  end

end
