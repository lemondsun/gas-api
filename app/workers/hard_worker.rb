class HardWorker
  include Sidekiq::Worker
include HTTParty
  def perform()
  #  get gas price
    @response = HTTParty.get( Rails.application.credentials.api[:gas_api])
    @gas_price = Hash['gas_price' => @response['gasPriceRange']['4'] ]

    # save gas price to table to be used in email
    @gas = GasPrice.new(@gas_price)

    # get all saved prices
    @prices = Price.all
    if @prices.length != 0
    @prices.each { 
      |price| if @gas['gas_price'] >= price.price
          SendNotificationsJob.perform_now(price.id)
          # delete the user saved price and any users dependent to it.
          Price.find(price.id).destroy
  end
}
else
puts' @gas'
end 
   end
end
 