class Person < ActiveRecord::Base
  acts_as_taggable
  def to_param
    name.gsub(/ /,'_').downcase + '_' + company.gsub(/ /,'_').downcase
  end
end
