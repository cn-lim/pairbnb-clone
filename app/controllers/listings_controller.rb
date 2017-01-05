class ListingsController < ApplicationController

  before_action :find_listing, only: [:show, :edit, :update]

  def index

    @listings = Listing.order(:created_at).reverse
    @listings = Listing.paginate(:page => params[:page], :per_page => 10)


    # @filterrific = initialize_filterrific(Listing, params[:filterrific], select_options: 
    #   {sorted_by: Listing.options_for_sorted_by,
    #     with_country_id: Listing.countries_with_listings,
    #     # with_tag_ids: Tag.options_for_select
    #   }

    # ) or return

    # @listings = @filterrific.find
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end

  def new
      @listing = Listing.new
  end

  def create

    @listing = current_user.listings.new(listing_params)

    if @listing.save
      redirect_to listings_path
    end
  end

  def show
    @booking = @listing.bookings.new
  end


  def edit
  end

  def update
    if @listing.update(listing_params)
      flash[:success] = "Listing updated"
      redirect_to @listing
    else
      flash[:danger] = "Invalid update"
      render :edit
    end
  end

  def find_listing

    @listing = Listing.find(params[:id])
  end

  private 

  def listing_params
    params.require(:listing).permit(:title, :description, :address, :room_type, :num_of_room, :max_guests, :price, :country_code, {images: []})
  end

end
