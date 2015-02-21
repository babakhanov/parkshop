class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception
  before_filter :set_start_time

  def set_start_time
    @start_time = Time.now.usec
  end
end
