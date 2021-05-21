module ApplicationHelper
  def nav_bar
    content_tag(:div, class: 'nav_bar') do
      content_tag(:div, (link_to 'Home', root_path, class: 'link')) +
        content_tag(:div, (link_to 'Sign up', new_user_registration_path, class: 'link' if !user_signed_in? &&
       (controller.controller_name != 'registrations'))) +
        content_tag(:div, (link_to 'Sign_in', user_session_path, class: 'link' if !user_signed_in? &&
        (controller.controller_name != 'sessions'))) +
        content_tag(:div,
                    (if user_signed_in?
                       link_to 'Sign out', destroy_user_session_path, class: 'link',
                                                                      method: :delete
                     end))
    end
  end
end
