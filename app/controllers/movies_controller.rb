class MoviesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  
  def index
    @movies = Movie.find(:all)
  end

  def show
    @movie = Movie.find(params[:id])
    @quotes = @movie.quotes.find(:all)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(params[:movie])
    
    if @movie.save
      flash[:notice] = 'Movie was successfully created.'
      redirect_to(@movie)
    else
      render :action => "new"
    end
    
  end
  
  def update
    @movie = Movie.find(params[:id])
    
    if @movie.update_attributes(params[:movie])
      flash[:notice] = 'Movie was successfully updated!'
      redirect_to(@movie)
    else
      render :action => 'edit'
    end
  end
  


  def edit
    @movie = Movie.find(params[:id])
  end

end
