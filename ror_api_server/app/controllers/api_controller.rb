class ApiController < ApplicationController
  def find
    #render :text => 'ok'
    #xxx = BPUpdateWorker.new(  )
    #xxx.perform("http://127.0.0.1:8888/")

    element = Bpclient.find_by(params[:key] => params[:value] )
    if element
      element = element.attributes.except("_id")
      render :json => element.to_json
    else
      render :text => {}
    end
  end
end
