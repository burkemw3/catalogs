Rails.application.config.middleware.use OmniAuth::Builder do  
  provider :twitter, 'IkMQVXtoRQlS4tRxmeR9xA', 'DjEg8h7TPcYIE4XD5ekMYCH1t1GGnOZ31NtAvs65k'  
  provider :linkedin, "consumer_key", "consumer_secret"
end