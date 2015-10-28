class ArticleTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :article
  
  validates_presence_of :tag
  validates_presence_of :article
  
  accepts_nested_attributes_for :tag
end
