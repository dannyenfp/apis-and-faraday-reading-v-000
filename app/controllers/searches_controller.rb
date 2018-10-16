class SearchesController < ApplicationController

  def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = 'BTO0WGOR2IT55JFD2QTRP5O1L3CEL5MCGQDLSYZUMHZZOBNZ'
      req.params['client_secret'] = 'IV4FF01VTIOKF0SP2UMZW41LQ2XRXLQZBMBR0OCFIL1NU1PC'
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end
          body = JSON.parse(@resp.body)
      if @resp.success?
        @venues = body["response"]["venues"]
      else
        @error = body["meta"]["errorDetail"]
      end
 
    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end 
  
   def search
  end
end
