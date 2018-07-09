class EdxImporter
  include HTTParty
  base_uri 'https://api.edx.org/'
  # fetch API
  # transform each relevant key value pair to the form we need according to schema
  # create instance of course

  def self.call
    # This method should "translate" the corresponding platform API
    # And create an instance of each course
    new.get_data
  end

  def initialize
    @data = nil
  end

  def get_data
    token = get_access_token
    @data = token
  end

  private

  def get_access_token
    url = "/oauth2/v1/access_token"
    options = {
      body: {
        grant_type: "client_credentials",
        client_id: ENV['EDX_API_CLIENT_ID'],
        client_secret: ENV['EDX_API_SECRET_KEY'],
        token_type: "jwt"
      }
    }
    self.class.post(url, options)
  end

end
