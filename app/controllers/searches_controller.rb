class SearchesController < ApplicationController

  def foursquare
    Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['BTO0WGOR2IT55JFD2QTRP5O1L3CEL5MCGQDLSYZUMHZZOBNZ'] = client_id
      req.params['client_secret'] = client_secret
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end
    render 'search'
  end
  
   def search
  end
end
