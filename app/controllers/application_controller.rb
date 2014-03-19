class ApplicationController < ActionController::Base

  before_filter :authenticate
  protect_from_forgery

  private
  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      begin
        @linker = IdentityLinker::Linker.new(user_name, password)
        @linker.find_linked_identity('relay_username','foo@example.com','ssoguid')
        true
      rescue IdentityLinker::Error => e
        false if e.to_s.strip == 'bad username'
      end
    end
  end
end
