require 'net/http'

class HomeController < ApplicationController
  def index
    render('home')
  end

  def confirm_access_request
    if params[:cloneFrom] != '' && (params[:cloneFrom] == "wangh10" || params[:cloneFrom] == "glockns1")
      uri = URI.parse("http://demo32-test.apigee.net/hackathon-servicenow/v1/access/#{params[:cloneFrom]}")
      http = Net::HTTP.new(uri.host, uri.port)

      data = params

      request = Net::HTTP::Get.new(uri.request_uri)
      request.set_form_data(data)

      response = http.request(request)

      parsed_response = JSON.parse(response.body)

      if parsed_response["accessList"][0]["accessItem"]["granted"]
        params[:clarity] = true
      end

      if parsed_response["accessList"][1]["accessItem"]["granted"]
        params[:siebel] = true
      end

      if parsed_response["accessList"][2]["accessItem"]["granted"]
        params[:toad] = true
      end

      render 'confirmation', params
    else
      params[:cloneFrom] = ''

      render 'confirmation', params
    end
  end

  def submit_access_request
    uri = URI.parse("http://demo32-test.apigee.net/hackathon-servicenow/v1/access")
    http = Net::HTTP.new(uri.host, uri.port)

    data = params

    request = Net::HTTP::Post.new(uri.request_uri)
    request.set_form_data(data)

    response = http.request(request)

    if JSON.parse(response.body)["message"] == "Access request successful"
      render 'success'
    else
      render 'failure'
    end
  end
end
