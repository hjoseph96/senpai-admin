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

  def self.ban_user(user_id, ban: true)
    new.ban_user(user_id)
  end

  def self.warn_user(user_id)
    new.warn_user(user_id)
  end

  def self.fetch_verify_requests(page: 1)
    new.fetch_verify_requests(page: page)
  end

  def self.fetch_verify_request(request_id)
    new.fetch_verify_request(request_id)
  end

  def self.deny_verify_request(request)
    new.deny(request)
  end

  def self.approve_verify_request(request)
    new.approve(request)
  end

  def self.fetch_all_reports(page: 1)
    new.fetch_all_reports(page: page)
  end

  def self.fetch_report(report_id)
    new.fetch_report(report_id)
  end

  def self.resolve_report(report_id)
    new.resolve_report(report_id)
  end

  def initialize(page: 1)
    @conn = Faraday.new(url:  ENV['API_URL'])
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

  def fetch_verify_requests(page: 1)
    res = @conn.post("/v1/admin/verify_request?page=#{page}").body
    @data = JSON.parse(res, object_class: OpenStruct)
  end

  def fetch_verify_request(request_id)
    res = @conn.post("/v1/admin/verify_request/#{request_id}").body
    @data = JSON.parse(res, object_class: OpenStruct)
  end

  def approve(request_id)
    res = @conn.post("/v1/admin/verify_request/#{request_id}/approve").body
    @data = JSON.parse(res, object_class: OpenStruct)
  end

  def deny(request_id)
    res = @conn.post("/v1/admin/verify_request/#{request_id}/deny").body
    @data = JSON.parse(res, object_class: OpenStruct)
  end

  def fetch_all_reports(page: 1)
    res = @conn.get("/v1/admin/reports?page=#{page}").body
    @data = JSON.parse(res, object_class: OpenStruct)
  end

  def fetch_report(report_id)
    res = @conn.get("/v1/admin/reports/#{report_id}/").body
    @data = JSON.parse(res, object_class: OpenStruct)
  end

  def resolve_report(report_id)
    res = @conn.post("/v1/admin/reports/#{report_id}/resolve").body
    @data = JSON.parse(res, object_class: OpenStruct)
  end
end
