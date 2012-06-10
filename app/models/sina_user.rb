class SinaUser < ActiveRecord::Base
  include BaseUser
  attr_accessible :sina_id
end
