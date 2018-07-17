class ScheduleCoursesController < ApplicationController
  before_action :set_schedule_course, only: [:show, :edit, :update, :destroy]

  # GET /schedule_courses
  # GET /schedule_courses.json
  def index
    @schedule_courses = ScheduleCourse.all
  end

  # GET /schedule_courses/1
  # GET /schedule_courses/1.json
  def show
  end

  # GET /schedule_courses/new
  def new
    @schedule_course = ScheduleCourse.new
  end

  # GET /schedule_courses/1/edit
  def edit
  end

  # POST /schedule_courses
  # POST /schedule_courses.json
  def create
    @schedule_course = ScheduleCourse.new(schedule_course_params)

    respond_to do |format|
      if @schedule_course.save
        format.html { redirect_to @schedule_course, notice: 'Schedule course was successfully created.' }
        format.json { render :show, status: :created, location: @schedule_course }
      else
        format.html { render :new }
        format.json { render json: @schedule_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedule_courses/1
  # PATCH/PUT /schedule_courses/1.json
  def update
    respond_to do |format|
      if @schedule_course.update(schedule_course_params)
        format.html { redirect_to @schedule_course, notice: 'Schedule course was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule_course }
      else
        format.html { render :edit }
        format.json { render json: @schedule_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedule_courses/1
  # DELETE /schedule_courses/1.json
  def destroy
    @schedule_course.destroy
    respond_to do |format|
      format.html { redirect_to schedule_courses_url, notice: 'Schedule course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule_course
      @schedule_course = ScheduleCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_course_params
      params.require(:schedule_course).permit(:quota, :start_time, :price, :state, :final_time, :course_id)
    end
end
