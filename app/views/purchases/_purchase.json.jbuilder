json.extract! purchase, :id, :plan_type, :user_id, :checkout_session_id, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)
