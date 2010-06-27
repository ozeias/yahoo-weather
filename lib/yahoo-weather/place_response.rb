class YahooWeather::PlaceResponse
  include HappyMapper
  tag 'Result'

  element :quality,       Integer
  element :latitude,      String 
  element :longitude,     String 
  element :offsetlat,     String 
  element :offsetlon,     String 
  element :radius,        String 
  element :line2,         String 
  element :line4,         String
  element :postal,        String 
  element :neighborhood,  String 
  element :city,          String 
  element :county,        String 
  element :state,         String 
  element :country,       String 
  element :countrycode,   String 
  element :statecode,     String 
  element :countycode,    String 
  element :uzip,          String 
  element :woeid,         Integer 
  element :woetype,       Integer
end