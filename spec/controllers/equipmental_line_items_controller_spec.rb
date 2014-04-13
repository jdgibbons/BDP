require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe EquipmentalLineItemsController do

  # This should return the minimal set of attributes required to create a valid
  # EquipmentalLineItem. As you add validations to EquipmentalLineItem, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "equipmental" => "" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EquipmentalLineItemsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all equipmental_line_items as @equipmental_line_items" do
      equipmental_line_item = EquipmentalLineItem.create! valid_attributes
      get :index, {}, valid_session
      assigns(:equipmental_line_items).should eq([equipmental_line_item])
    end
  end

  describe "GET show" do
    it "assigns the requested equipmental_line_item as @equipmental_line_item" do
      equipmental_line_item = EquipmentalLineItem.create! valid_attributes
      get :show, {:id => equipmental_line_item.to_param}, valid_session
      assigns(:equipmental_line_item).should eq(equipmental_line_item)
    end
  end

  describe "GET new" do
    it "assigns a new equipmental_line_item as @equipmental_line_item" do
      get :new, {}, valid_session
      assigns(:equipmental_line_item).should be_a_new(EquipmentalLineItem)
    end
  end

  describe "GET edit" do
    it "assigns the requested equipmental_line_item as @equipmental_line_item" do
      equipmental_line_item = EquipmentalLineItem.create! valid_attributes
      get :edit, {:id => equipmental_line_item.to_param}, valid_session
      assigns(:equipmental_line_item).should eq(equipmental_line_item)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new EquipmentalLineItem" do
        expect {
          post :create, {:equipmental_line_item => valid_attributes}, valid_session
        }.to change(EquipmentalLineItem, :count).by(1)
      end

      it "assigns a newly created equipmental_line_item as @equipmental_line_item" do
        post :create, {:equipmental_line_item => valid_attributes}, valid_session
        assigns(:equipmental_line_item).should be_a(EquipmentalLineItem)
        assigns(:equipmental_line_item).should be_persisted
      end

      it "redirects to the created equipmental_line_item" do
        post :create, {:equipmental_line_item => valid_attributes}, valid_session
        response.should redirect_to(EquipmentalLineItem.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved equipmental_line_item as @equipmental_line_item" do
        # Trigger the behavior that occurs when invalid params are submitted
        EquipmentalLineItem.any_instance.stub(:save).and_return(false)
        post :create, {:equipmental_line_item => { "equipmental" => "invalid value" }}, valid_session
        assigns(:equipmental_line_item).should be_a_new(EquipmentalLineItem)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        EquipmentalLineItem.any_instance.stub(:save).and_return(false)
        post :create, {:equipmental_line_item => { "equipmental" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested equipmental_line_item" do
        equipmental_line_item = EquipmentalLineItem.create! valid_attributes
        # Assuming there are no other equipmental_line_items in the database, this
        # specifies that the EquipmentalLineItem created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        EquipmentalLineItem.any_instance.should_receive(:update).with({ "equipmental" => "" })
        put :update, {:id => equipmental_line_item.to_param, :equipmental_line_item => { "equipmental" => "" }}, valid_session
      end

      it "assigns the requested equipmental_line_item as @equipmental_line_item" do
        equipmental_line_item = EquipmentalLineItem.create! valid_attributes
        put :update, {:id => equipmental_line_item.to_param, :equipmental_line_item => valid_attributes}, valid_session
        assigns(:equipmental_line_item).should eq(equipmental_line_item)
      end

      it "redirects to the equipmental_line_item" do
        equipmental_line_item = EquipmentalLineItem.create! valid_attributes
        put :update, {:id => equipmental_line_item.to_param, :equipmental_line_item => valid_attributes}, valid_session
        response.should redirect_to(equipmental_line_item)
      end
    end

    describe "with invalid params" do
      it "assigns the equipmental_line_item as @equipmental_line_item" do
        equipmental_line_item = EquipmentalLineItem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        EquipmentalLineItem.any_instance.stub(:save).and_return(false)
        put :update, {:id => equipmental_line_item.to_param, :equipmental_line_item => { "equipmental" => "invalid value" }}, valid_session
        assigns(:equipmental_line_item).should eq(equipmental_line_item)
      end

      it "re-renders the 'edit' template" do
        equipmental_line_item = EquipmentalLineItem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        EquipmentalLineItem.any_instance.stub(:save).and_return(false)
        put :update, {:id => equipmental_line_item.to_param, :equipmental_line_item => { "equipmental" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested equipmental_line_item" do
      equipmental_line_item = EquipmentalLineItem.create! valid_attributes
      expect {
        delete :destroy, {:id => equipmental_line_item.to_param}, valid_session
      }.to change(EquipmentalLineItem, :count).by(-1)
    end

    it "redirects to the equipmental_line_items list" do
      equipmental_line_item = EquipmentalLineItem.create! valid_attributes
      delete :destroy, {:id => equipmental_line_item.to_param}, valid_session
      response.should redirect_to(equipmental_line_items_url)
    end
  end

end
