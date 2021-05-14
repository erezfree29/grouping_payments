module ApplicationHelper
  def nav_bar
    content_tag(:div, class: 'nav_bar') do
      content_tag(:div,(link_to 'Home', root_path, class:'link')) + 
      content_tag(:div,(link_to 'Sign up',new_user_registration_path, class:'link'  if !user_signed_in?)) +
      content_tag(:div,(link_to 'Sign_in', user_session_path , class:'link')) + 
      content_tag(:div,(link_to 'Sign out',destroy_user_session_path, class:'link', method: :delete if user_signed_in?))
    end
  end
end
