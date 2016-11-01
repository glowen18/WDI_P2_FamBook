class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  def index
    @stories = Story.all
  end

  def new
    @board = Board.find(params[:board_id])
    @story = Story.new
  end

  def show
  end

  def edit
  end

  def create
    @board = Board.find(params[:board_id])
    @story = Story.new(story_params)
    @story.board = @board

    respond_to do |format|
      if @story.save
        format.html {redirect_to @board, notice: "Your story was successfully created!"}
      else
        format.html {render :new}
      end
    end
  end

  def update      
  end


end
