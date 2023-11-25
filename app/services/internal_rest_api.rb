# frozen_string_literal: true

require 'faraday'
class InternalRestApi
  def self.fetch_users(page: 1)
    new.fetch_users(page: page)
  end

  def initialize(page: 1)
    @conn = Faraday.new(url: 'http://localhost:3001/')
    fetch_users(page: page)
  end

  def fetch_users(page:  1)
    res = @conn.get("v1/admin/users?page=#{page}").body


    JSON.parse(res, object_class: OpenStruct)
  end
end
