require 'set'

class ActiveUsers < ApplicationRecord
  @users = Set.new
  class << self
    def add(user_name)
      @users.add(user_name)
    end

    def remove(user_name)
      @users.delete(user_name)
    end

    def all
      @users.to_a
    end
  end
end