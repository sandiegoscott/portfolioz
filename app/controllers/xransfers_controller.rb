class XransfersController < ApplicationController
  before_action :set_xransfer, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @xransfers = Xransfer.all
    respond_with(@xransfers)
  end

  def show
    respond_with(@xransfer)
  end

  def new
    @xransfer = Xransfer.new
    respond_with(@xransfer)
  end

  def edit
  end

  def create
    @xransfer = Xransfer.new(xransfer_params)
    @xransfer.save
    respond_with(@xransfer)
  end

  def update
    @xransfer.update(xransfer_params)
    respond_with(@xransfer)
  end

  def destroy
    @xransfer.destroy
    respond_with(@xransfer)
  end

  private
    def set_xransfer
      @xransfer = Xransfer.find(params[:id])
    end

    def xransfer_params
      params[:xransfer]
    end
end
