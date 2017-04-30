class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    render("/movies/show.html.erb")
  end

  def new_form
    render("/movies/new_form.html.erb")
  end

  def create_row
    title = params[:title]
    year = params[:year]
    duration = params[:duration]
    description = params[:description]
    image_url = params[:image_url]
    director_id = params[:director_id]

    new_movie = Movie.new
    new_movie.title = title
    new_movie.year = year
    new_movie.duration = duration
    new_movie.description = description
    new_movie.image_url = image_url
    new_movie.director_id = director_id

    new_movie.save
    redirect_to("/movies")

  end

  def edit_form
    @movie = Movie.find(params[:id])
    render("/movies/edit_form.html.erb")
  end

  def update_row
    movie = Movie.find(params[:id])
    title = params[:title]
    year = params[:year]
    duration = params[:duration]
    description = params[:description]
    image_url = params[:image_url]
    director_id = params[:director_id]

    movie.title = title
    movie.year = year
    movie.duration = duration
    movie.description = description
    movie.image_url = image_url
    movie.director_id = director_id

    movie.save
    redirect_to :controller => 'movies', :action => 'show', :id => movie.id
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to("/movies")
  end
end
