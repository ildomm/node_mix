class ApiController < ApplicationController
  def find
    element = Bpclient.find_by(params[:key] => params[:value] )
    if element
      element = element.attributes.except("_id")
      render :json => element.to_json
    else
      render :text => {}
    end
  end
end
