class Tag < ActiveRecord::Base
  
  has_many :article_tags
  has_many :articles, through: :article_tags
  belongs_to :category
  
  accepts_nested_attributes_for :article_tags, :articles
  
end
