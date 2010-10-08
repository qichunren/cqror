module ApplicationHelper

    def show_flash_messages
      [:notice, :warning, :message].collect do |key|
        content_tag(:div, flash[key], :class => "flash flash_#{key}") unless flash[key].blank?
      end.join
    end

end
