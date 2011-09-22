class Neuron < ActiveRecord::Base
  attr_accessible :body, :url
  
  def to_json(options = {})
    super(options.merge(:only => [ :id, :body, :url ]))
  end
end
