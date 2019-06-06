class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :lang, :contact, :a_propos]

  def home
  end

  def lang
    I18n.locale = params[:lang].to_sym
    redirect_to root_path(I18n.locale)
  end

  def dashboard
  end

  def contact
  end

  def a_propos
  end
end
