module ApplicationHelper
  def nav_bar
    content_tag(:div, class: 'nav_bar') do
      content_tag(:div, class: 'links') do
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

  def battery
    content_tag(:div, class: 'icons') do
      content_tag(:i, nil, class: 'fas fa-battery-half')
    end
  end

  def circle
    content_tag(:div, class: 'icons') do
      content_tag(:i, nil, class: 'fas fa-circle')
    end
  end

  def transparent_circle
    content_tag(:div, class: 'icons') do
      content_tag(:i, nil, class: 'far fa-circle')
    end
  end

  def bootstrap_class_for(flash_type)
    { success: 'alert-success', error: 'alert-danger', alert: 'alert-warning',
      notice: 'alert-info' }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def flash_messages(_opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)}", role: 'alert') do
               concat content_tag(:button, 'x', class: 'close', data: { dismiss: 'alert' })
               concat message
             end)
    end
    nil
  end
end
