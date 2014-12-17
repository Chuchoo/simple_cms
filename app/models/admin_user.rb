class AdminUser < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :username, :email

  has_secure_password

  # To configure a table name
  # self.table_name = "admin_users"
  has_and_belongs_to_many :pages
  has_many :section_edits
  has_many :sections, :through => :section_edits

end
