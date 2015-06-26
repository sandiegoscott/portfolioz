require 'rails_helper'

describe TransactionsController do

  describe 'GET #index' do
    it "populates an array of transactions"
    it "renders the :index template"
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

end
