class Event < ActiveRecord::Base
  has_many :attends
  
  def create_key
    require 'digest/sha1'
    Digest::SHA1.hexdigest(self.name)
  end
  
  def dsp_is_public
    return "非公開" if self.is_public.blank?
    (is_public == 1) ? "公開" : "非公開"
  end
  
end
