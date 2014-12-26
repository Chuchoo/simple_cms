class Page < ActiveRecord::Base
  attr_accessible :name, :permalink, :position, :visible, :subject_id

  belongs_to :subject
  has_many :sections
  has_and_belongs_to_many :editors, :class_name => "AdminUser"

  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  validates_presence_of :permalink
  validates_length_of :permalink, :within => 3..255

  scope :sorted, lambda{order("pages.position ASC")}
end
