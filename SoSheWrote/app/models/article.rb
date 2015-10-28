class Article < ActiveRecord::Base
  
  belongs_to :category, inverse_of: :articles
  has_many :comments
  has_many :article_tags
  has_many :tags, through: :article_tags
  
  accepts_nested_attributes_for :article_tags, :tags, :category
  validates_presence_of :category
  validates :content, presence: true
  validates :title, presence: true, uniqueness: true
  
  def self.is_published?
    where(published: true)
  end
  
end
