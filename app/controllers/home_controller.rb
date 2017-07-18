require 'net/http'

class HomeController < ApplicationController
  def index
    render('home')
  end

  def submit_access_request
    uri = URI.parse("http://demo32-test.apigee.net/hackathon-servicenow/v1/access")
    http = Net::HTTP.new(uri.host, uri.port)

    data = params

    request = Net::HTTP::Post.new(uri.request_uri)
    request.set_form_data(data)

    response = http.request(request)

    render :json => response.body
  end
end
