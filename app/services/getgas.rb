module Getgas
  class Search
   
      @response = Faraday.get ENV['GAS_API']

      data = JSON.parse(response.body)
      data['gasPriceRange']['4']
  
  end
end