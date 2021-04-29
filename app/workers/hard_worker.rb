class HardWorker
  include Sidekiq::Worker
include HTTParty
  def perform()
  #  get gas price
    @response = HTTParty.get( Rails.application.credentials.api[:gas_api])
    @gas_price = Hash['gas_price' => @response['fast']]

    # keeps the number of prices saved in the database at one
    @gas_prices = GasPrice.all
    if @gas_prices.length != 0
       @gas_prices[0].update_attribute(:gas_price, @gas_price['gas_price'])
    else
      # saves the most recent pull from api to GasPrice table.
      @gas = GasPrice.new(@gas_price)
      if @gas.save
       puts 'done'
      end
    end
  
@gas = @gas_prices[0]
  

    # get all saved user prices
    @prices = Price.all
    if @prices.length != 0
    @prices.each { 
      |price| if @gas['gas_price'] <= price.price
          SendNotificationsJob.perform_now(price.id)
          # delete the user saved price and any users dependent to it.
          Price.find(price.id).destroy
  end
}
end
   end
   
end
 