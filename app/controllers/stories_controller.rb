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
    @story.user = User.find_by(id: session[:user_id])

    if @story.save
      redirect_to @board, notice: "Your story was successfully created!"
    else
      render :new
    end
  end

  def update
    if @story.update(story_params)
      redirect_to @story, notice: 'Instruction was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @story.destroy
      redirect_to @board, notice: 'Story was successfully deleted.'
  end

  private

  def set_story
    @story = Story.find(params[:id])
    @board = Board.find(params[:board_id])
  end

  def story_params
    params.require(:story).permit(:story_date, :title, :description, :user_id, :board_id)
  end
end
