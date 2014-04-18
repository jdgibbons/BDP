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

describe MaterialLineItemsController do

  # This should return the minimal set of attributes required to create a valid
  # MaterialLineItem. As you add validations to MaterialLineItem, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "material" => "" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MaterialLineItemsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all material_line_items as @material_line_items" do
      material_line_item = MaterialLineItem.create! valid_attributes
      get :index, {}, valid_session
      assigns(:material_line_items).should eq([material_line_item])
    end
  end

  describe "GET show" do
    it "assigns the requested material_line_item as @material_line_item" do
      material_line_item = MaterialLineItem.create! valid_attributes
      get :show, {:id => material_line_item.to_param}, valid_session
      assigns(:material_line_item).should eq(material_line_item)
    end
  end

  describe "GET new" do
    it "assigns a new material_line_item as @material_line_item" do
      get :new, {}, valid_session
      assigns(:material_line_item).should be_a_new(MaterialLineItem)
    end
  end

  describe "GET edit" do
    it "assigns the requested material_line_item as @material_line_item" do
      material_line_item = MaterialLineItem.create! valid_attributes
      get :edit, {:id => material_line_item.to_param}, valid_session
      assigns(:material_line_item).should eq(material_line_item)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new MaterialLineItem" do
        expect {
          post :create, {:material_line_item => valid_attributes}, valid_session
        }.to change(MaterialLineItem, :count).by(1)
      end

      it "assigns a newly created material_line_item as @material_line_item" do
        post :create, {:material_line_item => valid_attributes}, valid_session
        assigns(:material_line_item).should be_a(MaterialLineItem)
        assigns(:material_line_item).should be_persisted
      end

      it "redirects to the created material_line_item" do
        post :create, {:material_line_item => valid_attributes}, valid_session
        response.should redirect_to(MaterialLineItem.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved material_line_item as @material_line_item" do
        # Trigger the behavior that occurs when invalid params are submitted
        MaterialLineItem.any_instance.stub(:save).and_return(false)
        post :create, {:material_line_item => { "material" => "invalid value" }}, valid_session
        assigns(:material_line_item).should be_a_new(MaterialLineItem)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        MaterialLineItem.any_instance.stub(:save).and_return(false)
        post :create, {:material_line_item => { "material" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested material_line_item" do
        material_line_item = MaterialLineItem.create! valid_attributes
        # Assuming there are no other material_line_items in the database, this
        # specifies that the MaterialLineItem created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        MaterialLineItem.any_instance.should_receive(:update).with({ "material" => "" })
        put :update, {:id => material_line_item.to_param, :material_line_item => { "material" => "" }}, valid_session
      end

      it "assigns the requested material_line_item as @material_line_item" do
        material_line_item = MaterialLineItem.create! valid_attributes
        put :update, {:id => material_line_item.to_param, :material_line_item => valid_attributes}, valid_session
        assigns(:material_line_item).should eq(material_line_item)
      end

      it "redirects to the material_line_item" do
        material_line_item = MaterialLineItem.create! valid_attributes
        put :update, {:id => material_line_item.to_param, :material_line_item => valid_attributes}, valid_session
        response.should redirect_to(material_line_item)
      end
    end

    describe "with invalid params" do
      it "assigns the material_line_item as @material_line_item" do
        material_line_item = MaterialLineItem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        MaterialLineItem.any_instance.stub(:save).and_return(false)
        put :update, {:id => material_line_item.to_param, :material_line_item => { "material" => "invalid value" }}, valid_session
        assigns(:material_line_item).should eq(material_line_item)
      end

      it "re-renders the 'edit' template" do
        material_line_item = MaterialLineItem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        MaterialLineItem.any_instance.stub(:save).and_return(false)
        put :update, {:id => material_line_item.to_param, :material_line_item => { "material" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested material_line_item" do
      material_line_item = MaterialLineItem.create! valid_attributes
      expect {
        delete :destroy, {:id => material_line_item.to_param}, valid_session
      }.to change(MaterialLineItem, :count).by(-1)
    end

    it "redirects to the material_line_items list" do
      material_line_item = MaterialLineItem.create! valid_attributes
      delete :destroy, {:id => material_line_item.to_param}, valid_session
      response.should redirect_to(material_line_items_url)
    end
  end

end