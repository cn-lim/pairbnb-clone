class ReservationMailer < ActionMailer::Base

  default from: "from@example.com"

  def booking_email(customer, host, reservation_id)
    @customer = customer
    @host = host  
    @reservation_id = reservation_id

    mail(to: @host.email, subject: 'Booking Email')

  end
end
