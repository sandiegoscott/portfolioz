class DepositsController < ApplicationController
  before_action :set_deposit, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @deposits = Transaction::Deposit.all
    respond_with(@deposits)
  end

  def show
    respond_with(@deposit)
  end

  def new
    @deposit = Transaction::Deposit.new
    respond_with(@deposit)
  end

  def edit
  end

  def create
    @deposit = Transaction::Deposit.new(deposit_params)
    @deposit.save
    respond_with(@deposit)
  end

  def update
    @deposit.update(deposit_params)
    respond_with(@deposit)
  end

  def destroy
    @deposit.destroy
    respond_with(@deposit)
  end

  private
    def set_deposit
      @deposit = Transaction::Deposit.find(params[:id])
    end

    def deposit_params
      params[:deposit]
    end
end
