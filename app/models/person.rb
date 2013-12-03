class Person < ActiveRecord::Base
  acts_as_taggable

  validates :name, presence: true
  validates :company, presence: true

  after_create :store_slug
  def to_param
    name.gsub(/ /,'_').downcase + '_' + company.gsub(/ /,'_').downcase
  end

  def store_slug
    self.slug = name.gsub(/ /,'_').downcase + '_' + company.gsub(/ /,'_').downcase
    save!
  end
end
