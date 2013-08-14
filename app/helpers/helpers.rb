def check_errors
	@event = Event.create(params)
  session[:errors] = @event.errors.full_messages
  if session[:errors].any?
    data = erb :errors, :layout => false
    { :html => data, :errors => true }.to_json
  else
    { :errors => false }.to_json
  end
end
