class BoardsController < ApplicationController
    before_action :find_board, only: [:show, :edit , :update , :destroy]

  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    # clear_params = params.require(:board).permit(:title)
    @board = Board.new(clear_params)
    if @board.save
      redirect_to '/',notice: "新增成功"
    else
      render :new
    end
  end

  def show
    # @board = Board.find(params[:id])
  end

  def edit
    # @board = Board.find(params[:id])
  end

  def update
    # @board = Board.find(params[:id])
    # clear_params = params.require(:board).permit(:title)
    # clear_params = params[:board].permit(:title)
    # @board = Board.new(clear_params)
    if @board.update(clear_params)
      redirect_to '/',notice: "編輯成功"
    else
      render :edit
    end
  end

  def destroy
    # @board = Board.find(params[:id])
    @board.destroy
    redirect_to root_path ,notice: "刪除成功"
  end

  private
    def find_board
      @board = Board.find(params[:id])
    end
 
    def clear_params
      params.require(:board).permit(:title)
    end
end
