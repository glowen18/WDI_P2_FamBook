class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  def index
    @boards = Board.all
  end

  def new
    @board = Board.find(params[:board_id])
    @story = Story.new
  end

  def create
    @board = Board.find(params[:recipe_id])
    @story = Story.new(story_params)
    @story.board = @board
    if @story.save
      redirect_to @board
    else
      render :new
    end
  end

  def show
    @board = Board.find(params[:board_id])
  end

  def edit

  end
end
