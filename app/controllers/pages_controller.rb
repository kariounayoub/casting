class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :contact, :a_propos]

  def home
  end

  def dashboard
  end

  def contact
  end

  def a_propos
  end
end
