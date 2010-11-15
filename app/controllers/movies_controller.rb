class MoviesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  
  def index
    @movies = Movie.find(:all)
  end

  def show
    @movie = Movie.find(params[:id])
    @quotes = @movie.quotes.find(:all)
    @search = Twitter::Search.new.containing(@movie.title).lang('en').rpp(10)
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
  
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie was successfully deleted."
    redirect_to :action => "index"
  end


  def edit
    @movie = Movie.find(params[:id])
  end

end
