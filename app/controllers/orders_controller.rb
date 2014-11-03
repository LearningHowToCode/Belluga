class OrdersController < ApplicationController
  respond_to :html, :xml, :json
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

 def lessons
    @orders = Order.all.where(tutor: current_user).order("created_at DESC")
  end

  def purchases
    @orders = Order.all.where(buyer: current_user).order("created_at DESC")
  end

  def new
    @order = Order.new
    @listing = Listing.find(params[:listing_id])
  end

  def create
    @order = Order.new(order_params)
    @listing = Listing.find(params[:listing_id])
    @tutor = @listing.user

    @order.listing_id = @listing.id
    @order.buyer_id = current_user.id
    @order.tutor_id = @tutor.id

    respond_to do |format|
      if @order.save
        format.html { redirect_to root_url, notice: 'Order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entry }
      end
    end
  end



  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:address, :city, :state)
    end
end
