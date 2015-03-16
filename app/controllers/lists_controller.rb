class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "List successfully added!"
      redirect_to lists_path
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    redirect_to lists_path
  end

  def destroy
    @list = List.find(params[:id])
    if @list.destroy
      flash[:destroyed] = "that is gone"
    end
    redirect_to lists_path
  end
end

params = { :list => { :description => "hello", :name => "world", :moola => "" } }

params.require(:list).permit(:name, :description, :other)
