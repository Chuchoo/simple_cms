class PagesController < ApplicationController

  layout false

  def index
    @pages = Page.sorted
  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      flash[:notice] = "The page #{@page.name} is created"
      redirect_to(:action => 'index')
    else
      render 'new'
    end
  end

  def new
    @page = Page.new
  end

  def show
    @page = Page.find(params[:id])
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      flash[:notice] = "The page #{@page.name} is updated"
      redirect_to(:action => 'show',:id => @page.id)
    else
      render 'edit'
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page =Page.find(params[:id]).destroy
    flash[:notice] = "The page #{@page.name}has been deleted."
    redirect_to(:action => 'index')
  end
end


