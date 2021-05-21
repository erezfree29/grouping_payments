# rubocop: disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity, Metrics/ModuleLength, Metrics/MethodLength
module ApplicationHelper
  def nav_bar
    content_tag(:div, class: 'nav_bar') do
      unless controller.action_name == 'home'
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

  def home_links
    content_tag(:div, class: 'nav_bar') do
      content_tag(:div, (if !user_signed_in? &&
     (controller.controller_name != 'registrations')
                           button_to 'Sign up', new_user_registration_path, method: :get,
                                                                            class: 'link w3-button w3-green'
                         end)) +
        content_tag(:div, (if !user_signed_in? &&
        (controller.controller_name != 'sessions')
                             button_to 'Sign_in', user_session_path, method: :get,
                                                                     class: 'link w3-button w3-green'
                           end))
    end
  end
end
# rubocop: enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity,  Metrics/ModuleLength, Metrics/MethodLength