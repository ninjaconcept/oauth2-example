class Article < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  validates_presence_of :name, :content
  
  named_scope :recent, :limit => 5
end