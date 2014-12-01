class SectionsController < ApplicationController

  layout 'admin'

  def index
    @sections = Section.sorted
  end

  def new
    @section = Section.new
  end

  def edit
    @section = Section.find(params[:id])
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
       render 'new'
    end
  end


  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(params[:section])
       flash[:notice] = "Section #{@section.name} is updated"
       redirect_to(:action => 'show', :id => @section.id)
    else
       render 'edit'
    end
  end

  def destroy
    @section = Section.find(params[:id]).destroy
    flash[:notice] = "Section #{@section.name} is deleted."
    redirect_to(:action => 'index')
  end

end
