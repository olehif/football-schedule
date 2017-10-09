class Footballdata
  def initialize(api_key = ENV['FOOTBALLDATA_API_KEY'])
    @api_key = api_key
  end

  def fixtures(time_frame = 'n5')
    HTTParty.get("http://api.football-data.org/v1/fixtures?timeFrame=#{time_frame}",
                 headers: { 'X-Auth-Token' => @api_key }).to_a
  end

  def fixture(id)
    HTTParty.get("http://api.football-data.org/v1/fixtures/#{id}",
                 headers: { 'X-Auth-Token' => @api_key }).to_a
  end
end
