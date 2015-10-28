class Category < ActiveRecord::Base
  has_many :articles, inverse_of: :category
  has_many :tags, through: :articles
  
  accepts_nested_attributes_for :articles
  
  validates :name, presence: true
  validates_presence_of :articles
  before_save :normalize_name
  
  def normalize_name
    self.name = self.name.downcase
  end
end
