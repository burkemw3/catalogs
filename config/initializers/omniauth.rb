Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, 'IkMQVXtoRQlS4tRxmeR9xA', 'DjEg8h7TPcYIE4XD5ekMYCH1t1GGnOZ31NtAvs65k'
end