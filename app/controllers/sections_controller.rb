class SectionsController < ApplicationController

  layout 'admin'
  before_filter :confirm_logged_in

  def index
    @sections = Section.sorted
  end

  def new
    @section = Section.new
    @pages = Page.sorted
    @section_count = Section.count + 1
  end

  def edit
    @section = Section.find(params[:id])
    @pages = Page.sorted
    @section_count = Section.count
  end

  def delete
    @section = Section.find(params[:id])
  end

  def show
    @section = Section.find(params[:id])
  end


  def create
    @section = Section.new(params[:section])
    if @section.save
       flash[:notice] = "Section #{@section.name} is created"
       redirect_to(:action => 'index')
    else
      @section_count = Section.count + 1
      @pages = Page.sorted
       render 'new'
    end
  end


  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(params[:section])
       flash[:notice] = "Section #{@section.name} is updated"
       redirect_to(:action => 'show', :id => @section.id)
    else
      @section_count = Section.count
      @pages = Page.sorted
       render 'edit'
    end
  end

  def destroy
    @section = Section.find(params[:id]).destroy
    flash[:notice] = "Section #{@section.name} is deleted."
    redirect_to(:action => 'index')
  end

end
