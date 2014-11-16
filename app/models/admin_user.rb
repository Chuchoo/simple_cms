class AdminUser < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :username

  # To configure a table name
  # self.table_name = "admin_users"
  has_and_belongs_to_many :pages


end
