# frozen_string_literal: true

class SplashesController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  def index; end
end
