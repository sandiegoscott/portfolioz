require 'rails_helper'

describe TransactionsController do

  describe 'GET #index' do
    it "populates an array of all transactions" do
      deposit = FactoryGirl.create(:deposit)
      withdrawal = FactoryGirl.create(:withdrawal)
      get :index
      expect(assigns(:transactions)).to match_array([deposit, withdrawal])
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it "assigns the requested transaction to @transaction" do
      transaction = FactoryGirl.create(:deposit)
      get :show, id: transaction
      expect(assigns(:transaction)).to eq transaction
    end

    it "renders the :show template" do
      transaction = FactoryGirl.create(:deposit)
      get :show, id: transaction
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it "assigns a new transaction to @transaction" do
      get :new
      expect(assigns(:transaction)).to be_a_new(Transaction)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested transaction to @transaction" do
      transaction = FactoryGirl.create(:transaction)
      get :edit, id: transaction
      expect(assigns(:transaction)).to eq transaction
    end
    it "renders the :edit template" do
      transaction = FactoryGirl.create(:transaction)
      get :edit, id: transaction
      expect(response).to render_template :edit
    end
  end

end

