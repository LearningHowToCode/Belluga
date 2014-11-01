class ListingsController < ApplicationController
  respond_to :html, :xml, :json
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index
    @listings = Listing.all
    respond_with(@listings)
  end

  def show
    respond_with(@listing)
  end

  def new
    @listing = Listing.new
    respond_with(@listing)
  end

  def edit
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.save
    respond_with(@listing)
  end

  def update
    @listing.update(listing_params)
    respond_with(@listing)
  end

  def destroy
    @listing.destroy
    respond_with(@listing)
  end

  private
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def listing_params
      params.require(:listing).permit(:name, :format, :location, :description, :price)
    end
end
