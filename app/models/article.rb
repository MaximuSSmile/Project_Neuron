class Article < ActiveRecord::Base
  belongs_to :soul
  has_many :artcomments

  has_attached_file :imgarticle, styles: { large: "300x300#", medium: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :imgarticle, content_type: /\Aimage\/.*\Z/
end
