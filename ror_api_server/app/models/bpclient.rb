class Bpclient
  include Mongoid::Document
  store_in collection: 'bp'

  field :id, type: Integer
  field :phone, type: String
  field :fax, type: String

end
