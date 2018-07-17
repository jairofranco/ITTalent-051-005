require 'test_helper'

class ScheduleCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @schedule_course = schedule_courses(:one)
  end

  test "should get index" do
    get schedule_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_schedule_course_url
    assert_response :success
  end

  test "should create schedule_course" do
    assert_difference('ScheduleCourse.count') do
      post schedule_courses_url, params: { schedule_course: { course_id: @schedule_course.course_id, final_time: @schedule_course.final_time, price: @schedule_course.price, quota: @schedule_course.quota, start_time: @schedule_course.start_time, state: @schedule_course.state } }
    end

    assert_redirected_to schedule_course_url(ScheduleCourse.last)
  end

  test "should show schedule_course" do
    get schedule_course_url(@schedule_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_schedule_course_url(@schedule_course)
    assert_response :success
  end

  test "should update schedule_course" do
    patch schedule_course_url(@schedule_course), params: { schedule_course: { course_id: @schedule_course.course_id, final_time: @schedule_course.final_time, price: @schedule_course.price, quota: @schedule_course.quota, start_time: @schedule_course.start_time, state: @schedule_course.state } }
    assert_redirected_to schedule_course_url(@schedule_course)
  end

  test "should destroy schedule_course" do
    assert_difference('ScheduleCourse.count', -1) do
      delete schedule_course_url(@schedule_course)
    end

    assert_redirected_to schedule_courses_url
  end
end
