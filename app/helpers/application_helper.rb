module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def display_date(ride)
    ride.date.strftime("%b #{ride.date.day.ordinalize}")
  end

  def display_time(ride)
    ride.time.strftime("%l:%M%P")
  end
end
