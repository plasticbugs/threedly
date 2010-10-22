class GamesController < ApplicationController
  
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @quotes = @game.quotes.find(:all)
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(params[:game])
    
    if @game.save
      flash[:notice] = 'Game was successfully created.'
      redirect_to(@game)
    else
      render :action => "new"
    end
    
  end
  
  def update
    @game = Game.find(params[:id])
    
    if @game.update_attributes(params[:game])
      flash[:notice] = 'Game was successfully updated!'
      redirect_to(@game)
    else
      render :action => 'edit'
    end
  end
  


  def edit
    @game = Game.find(params[:id])
  end

end