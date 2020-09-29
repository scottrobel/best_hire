json.extract! job_application, :id, :first_name, :last_name, :email, :job_id, :created_at, :updated_at
json.url job_application_url(job_application, format: :json)
