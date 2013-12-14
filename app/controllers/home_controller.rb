class HomeController < ApplicationController
  def index
    @people = Person.all
  end

  def search
    @people = Person.text_search(params[:query])
  end

  def show
    @person = Person.find_by_slug(params[:id])
  end

  def people_by_tag
    @people = Person.tagged_with(params[:tag])
  end

  def giktuts

  end
  def about

  end
end
