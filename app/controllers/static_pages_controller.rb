class StaticPagesController < ApplicationController
  before_action :logged_in?, only: [:top]

  def top
  end
end
