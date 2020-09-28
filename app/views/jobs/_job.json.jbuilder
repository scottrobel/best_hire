json.extract! job, :id, :company_website_link, :description, :remote, :company_website_apply_link, :contact_email, :created_at, :updated_at
json.url job_url(job, format: :json)
