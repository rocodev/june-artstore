class CartsController < ApplicationController
  before_action :authenticate_user!, :only => [:checkout]

  def index
  end
end
