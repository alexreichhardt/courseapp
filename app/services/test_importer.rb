class TestImporter
  include HTTParty
  base_uri 'https://api.edx.org/'
  # fetch API
  # transform each relevant key value pair to the form we need according to schema
  # create instance of course

  def self.call
    # This method should "translate" the corresponding platform API
    # And create an instance of each course
    token = "eyJhbGciOiJIUzI1NiJ9.eyJzY29wZXMiOiBbInJlYWQiLCAid3JpdGUiLCAicHJvZmlsZSIsICJlbWFpbCJdLCAiYWRtaW5pc3RyYXRvciI6IGZhbHNlLCAiYXVkIjogInJpbm15YnllZG51YXc1cGhsaWRDb2NEdWRieWxiT2JEaWJKb2Rib3NnZXRzRWJhbGQ0IiwgImZhbWlseV9uYW1lIjogIiIsICJpc3MiOiAiaHR0cHM6Ly9jb3Vyc2VzLmVkeC5vcmcvb2F1dGgyIiwgImZpbHRlcnMiOiBbXSwgInByZWZlcnJlZF91c2VybmFtZSI6ICJBbGV4UmVpY2hoYXJkdCIsICJuYW1lIjogIkFsZXhhbmRlciBSZWljaGhhcmR0IiwgInZlcnNpb24iOiAiMS4xLjAiLCAiZ2l2ZW5fbmFtZSI6ICIiLCAiZXhwIjogMTUzMTIwNTYzMSwgImlhdCI6IDE1MzExNjk2MzEsICJpc19yZXN0cmljdGVkIjogZmFsc2UsICJlbWFpbCI6ICJhbGV4YW5kZXIucmVpY2hoYXJkdEB3aHUuZWR1IiwgInN1YiI6ICIzMzYxMDdmZWUyYjY5ODVjYzRjYTgzM2U1NDIyZmYwNCJ9.lK5pLqNLtv0NWsm70kz2Wa1w3XoVwuMN3ZZQqs6mu2Q"
    new.get_data(token)
  end

  def initialize
    @access_token
    @data = nil
  end

  # def get_data
  #   # token_hash = get_access_token
  #   # @access_token =

  #   @data = nil
  # end

  def get_data(token)
    url = "/catalog/v1/catalogs/284/courses/"
    options = {:headers => {'Authorization' => 'JWT ' + token }}

    puts options


    # HTTParty.get(url + base_uri, :headers => {'Authorization' => 'JWT ' + token})

    self.class.get(url, options)
  end
end
