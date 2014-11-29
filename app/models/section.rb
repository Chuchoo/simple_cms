class Section < ActiveRecord::Base
  attr_accessible :name, :position, :content_type, :content, :visible, :page_id
  belongs_to :page
  has_many :section_edits
  has_many :editors, :through => :section_edits, :class_name => "AdminUser"

  scope :sorted, lambda{order("sections.position ASC")}
end
