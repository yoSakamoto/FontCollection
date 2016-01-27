require 'bundler/setup'
Bundler.require
if development?
    ActiveRecord::Base.establish_connection(ENV['DATABASE_URL']||"sqlite3:db/development.db")
end

class History < ActiveRecord::Base
end

class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
end

class Review < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
end