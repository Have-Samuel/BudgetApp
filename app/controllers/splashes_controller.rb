# frozen_string_literal: true

class SplashesController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :authenticate_user!

  def index; end
end
