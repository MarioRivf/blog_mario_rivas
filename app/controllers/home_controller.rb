# frozen_string_literal: true

# Controller responsible for handling home-related actions.
class HomeController < ApplicationController
    before_action :authenticate_user!
    def index; end
  end
