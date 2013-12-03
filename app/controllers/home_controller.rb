class HomeController < ApplicationController
  def index
    @people = Person.all
  end

  def show
    @person = Person.find_by_slug(params[:id])
  end

  def giktuts

  end
  def about

  end
end
