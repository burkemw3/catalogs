Rails.application.config.middleware.use OmniAuth::Builder do  
  provider :twitter, 'IkMQVXtoRQlS4tRxmeR9xA', 'DjEg8h7TPcYIE4XD5ekMYCH1t1GGnOZ31NtAvs65k'  
  provider :linkedin, "consumer_key", "consumer_secret"
  provider :google_oauth2, '754768717113.apps.googleusercontent.com', 'FjuhbOH_P8chp3l3Jwggi5QI'
end