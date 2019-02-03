class SchoolClassesController < ApplicationController
  before_action :set_school_class, only: [:show, :edit, :update]

  def new
    @school_class = SchoolClass.new
  end

  def create
    @school_class = SchoolClass.new
    @school_class.title = params[:school_class][:title]
    @school_class.room_number = params[:school_class][:room_number]
    @school_class.save
    redirect_to school_class_path(@school_class)
  end

  def update
    @school_class.update(params[:school_class])
    redirect_to school_class_path(@school_class)
  end

  private

  def set_school_class
    @school_class = SchoolClass.find(params[:id])
  end

  def school_class_params
    params.require(:school_class).permit(:title, :room_number)
  end
end