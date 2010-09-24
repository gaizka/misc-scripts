require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

ActiveRecord::Schema.define(:version => 1) do

  create_table :users do |t|
    t.string  :login
    t.string  :full_name
    t.date    :date_of_birth
  end

  create_table :apples do |t|
    t.references :user
    t.string :color
  end
end

class User < ActiveRecord::Base
  has_many :apples
  before_create :set_login

  def age
    now = Time.now.utc.to_date
    now.year - date_of_birth.year - ((now.month > date_of_birth.month || (now.month == date_of_birth.month && now.day >= date_of_birth.day)) ? 0 : 1)
  end

  private
  def set_login
    self.login = full_name.downcase.gsub(/ /, "_")
  end

end
