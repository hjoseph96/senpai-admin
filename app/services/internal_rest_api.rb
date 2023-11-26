# frozen_string_literal: true

require 'faraday'
class InternalRestApi
  def self.fetch_users(page: 1)
    new.fetch_users(page: page)
  end

  def self.fetch_all_users
    new.fetch_all_users
  end

  def self.fetch_user(user_id)
    new.fetch_user(user_id)
  end

  def self.ban_user(user_id)
    new.ban_user(user_id)
  end

  def self.warn_user(user_id)
    new.warn_user(user_id)
  end

  def initialize(page: 1)
    @conn = Faraday.new(url: 'http://localhost:3001/')
  end

  def fetch_user(user_id)
    res = @conn.get("v1/admin/users/#{user_id}").body
    JSON.parse(res, object_class: OpenStruct)
  end

  def fetch_users(page:  1)
    res = @conn.get("v1/admin/users?page=#{page}").body
    JSON.parse(res, object_class: OpenStruct)
  end

  def fetch_all_users
    res = @conn.get("v1/admin/users/all_users").body
    @data = JSON.parse(res, object_class: OpenStruct)
  end

  def warn_user(user_id)
    res = @conn.post("v1/admin/users/#{user_id}/warn_user").body
    @data = JSON.parse(res, object_class: OpenStruct)
  end

  def ban_user(user_id)
    res = @conn.post("v1/admin/users/#{user_id}/ban_user").body
    @data = JSON.parse(res, object_class: OpenStruct)
  end
end
