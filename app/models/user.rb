class User < ActiveRecord::Base
  def serialize
    hash = {}
    attributes.each{ |key, val| hash[key] = val }
    hash
  end
end
