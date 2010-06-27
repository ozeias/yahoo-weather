class YahooWeather::Place
  # the url with which we obtain PlaceFinder information from yahoo
  @@API_URL = "http://where.yahooapis.com/geocode"

  def initialize(app_id, locale = 'en_US', api_url = @@API_URL)
    @app_id  = app_id
    @locale  = locale
    @api_url = api_url
  end

  # Yahoo! PlaceFinder is a geocoding Web service that helps developers make their
  # applications location-aware by converting street addresses or place names into geographic 
  # coordinates (and vice versa)
  #
  # The PlaceFinder web service allows you to convert street addresses 
  # (like “1600 Pennsylvania Avenue, Washington, DC”) or place names (like “Washington, DC”) 
  # into geographic coordinates (like latitude 38.898717, longitude -77.035974) that you can use as 
  # the center of a map or the position for a map marker. This conversion is called “geocoding” and 
  # can be used to make your applications location-aware.
  #
  # The service also allows you to convert geographic coordinates into street addresses or place 
  # names. This conversion is called "reverse geocoding" and can be used to provide user feedback 
  # when only coordinates are known.
  #
  # +location+ a geographical location (701 First Ave., Sunnyvale, CA 94089).
  #
  def lookup_location(location)
    url = @api_url + '?location=' + CGI.escape(location) + '&locale=' + CGI.escape(@locale) + '&appid=' + CGI.escape(@app_id)
    _lookup(location, url)
  end

  private
    def _lookup(src, url)
      begin
        response = Net::HTTP.get_response(URI.parse(url)).body.to_s

      rescue => e
        raise RuntimeError.new("failed to get weather [src=#{src}, " +
                               "url=#{url}, e=#{e}].")
      end

      # create the response object
      doc = Nokogiri::XML.parse(response)
      YahooWeather::PlaceResponse.parse(doc.to_s)
    end
end