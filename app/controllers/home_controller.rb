class HomeController < ApplicationController
  def index
    @people = Person.all
  end

  def show
    @person = Person.first
  end

  def giktuts

  end
  def about

  end
end
