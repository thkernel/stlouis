OrangeSms.setup do |config|
  # Sender Name
  # config.sender_name = 'GITHUB'
  config.sender_name = 'LeSaintLouis'

  # Sender Phone
  config.sender_phone = '70471135'

  # Sender country code. Follow ISO-3166 alpha 3 country codes. Default country value is :sen (Senegal)
  # You can find supported countries by Orange Api in the folllowing link https://developer.orange.com/apis/sms-sn/getting-started
  # config.sender_country_code = :sen

  # Follow ISO-3166 alpha 3 country codes. Default country value is :sen (Senegal)
  # Use the country code of your receivers. You can find supported countries by Orange Api in the folllowing link https://developer.orange.com/apis/sms-sn/getting-started
  # config.default_receiver_country_code = :sen

  # Authorization Header you can find the Authorization header in your app dashboard https://developer.orange.com/myapps
  config.authorization = 'Basic Z1E1U2xBNXhyd213SGNZWEpKYTJUa3N3djQ1VWFJTng6THEyM2JLZjhETmozMTNBaw=='

  # Generate the access token with the interactive console
  # --> client = OrangeSms::Client.new
  # --> client.fetch_access_token => 'CeppeLvEUgWK4o0r2WW2IzBrMQEn'
  config.access_token = 'pz0QMmiXSE54UYykvHqSTJwqxIkn'
end
