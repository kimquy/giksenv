class Person < ActiveRecord::Base
  acts_as_taggable

  dragonfly_accessor :photo

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

  def get_tags
    self.tags.map(&:name)
  end

  def self.get_all_tags
    Person.tag_counts_on(:tags).map(&:name)
  end
end
