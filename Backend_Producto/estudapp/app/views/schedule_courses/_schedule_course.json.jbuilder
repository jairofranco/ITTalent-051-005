json.extract! schedule_course, :id, :quota, :start_time, :price, :state, :final_time, :course_id, :created_at, :updated_at
json.url schedule_course_url(schedule_course, format: :json)
