class CloneLoginController < ApplicationController
  def index
    render('clone_login')
  end

  def show
    uri = URI.parse("http://demo32-test.apigee.net/hackathon-servicenow/v1/access/wangh10")
    http = Net::HTTP.new(uri.host, uri.port)

    data = params

    request = Net::HTTP::Get.new(uri.request_uri)
    request.set_form_data(data)

    response = http.request(request)

    render :json => response.body
  end
end
