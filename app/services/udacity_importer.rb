class UdacityImporter
  include HTTParty

  def self.call
    # This method should "translate" the corresponding platform API
    # And create an instance of each course

    response = HTTParty.get('https://www.udacity.com/public-api/v0/courses')
    response["courses"].each do |course|
      puts course["title"]
    end

  end
end

