class UserDecorator < SimpleDelegator
  #delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

# This method put "Dr" before each doctor's name in Doctorprofile View
    def concat_name
        "Dr #{name}"
    end

# This method puts the pps number in all capitals
    def pps_to_uppercase
        "pps number".upcase
    end

 # Conditional for Gender-> Pink (Female) Blue (Male) for show page
    def gender_status_show(gender_status)
        if gender_status.to_str.include? "Male"
            '<li><p style = "color: blue;">Gender Status : Male </p></li>'.html_safe
        else
            '<li><p style = "color: pink;">Gender Status : Female </p></li>'.html_safe
        end
    end


end
