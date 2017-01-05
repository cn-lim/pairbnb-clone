class BookingsController < ApplicationController


  def show
    @user = User.find(params[:user_id])
    @booking = @user.booking.last
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @booking = current_user.bookings.new(booking_params)
    @booking.listing = @listing
    if @booking.save
      ReservationMailer.booking_email(@booking.user, @listing.user, @booking.id ).deliver_now
      redirect_to listing_booking_path
    else
      @errors = @booking.errors.full_messages
      render "listings/show"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to @booking.user
  end

  def booking_params
    params.require(:booking).permit(:num_guests, :start_date, :end_date)
  end


end
