class PagesController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in

  def index
    @pages = Page.sorted
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "The page #{@page.name} is created"
      redirect_to(:action => 'index')
    else
      @subjects = Subject.sorted
      @page_count = Page.count + 1
      render 'new'
    end
  end

  def new
    @page = Page.new
    @subjects = Subject.order("position ASC")
    @page_count = Page.count + 1
  end

  def show
    @page = Page.find(params[:id])
  end

  def edit
    @page = Page.find(params[:id])
    @subjects = Subject.sorted
    @page_count = Page.count
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "The page #{@page.name} is updated"
      redirect_to(:action => 'show',:id => @page.id)
    else
      @page_count = Page.count
      @subjects = Subject.sorted
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

  private

  def page_params
    # same as using "params[:subject]", except that it:
    # - raises an error if :subject is not present
    # - allows listed attributes to be mass-assigned
    params.require(:page).permit(:name, :permalink, :position, :visible, :subject_id)
  end

end


