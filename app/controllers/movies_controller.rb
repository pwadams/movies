class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(params.require(:movie).permit(:title, :rating))
    if @movie.save
    redirect_to movies_path
  else render :new
  end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(params.require(:movie).permit(:title, :rating))
    redirect_to movies_path(@movie)
  else render :edit
  end
  end

  def destroy
    Movie.destroy(params[:id])
    redirect_to movies_path
    end
end
