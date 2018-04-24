class FlashService

  def initialize(type, message_b, message_r)
    set_type(type)
    @mess_b = message_b
    @mess_r = message_r
  end

  def perform
    return ApplicationController.render(partial: "flash",
                                        locals: {alert_type: @alert_type,
                                                 alert_icon: @alert_icon,
                                                 bold_message: @mess_b,
                                                 regular_message: @mess_r
                                        })
  end

  private

  def set_type(type)
    if type == "info"
      @alert_type = "info"
      @alert_icon = "info_outline"
    elsif type == "success"
      @alert_type = "success"
      @alert_icon = "check"
    elsif type == "warning"
      @alert_type = "warning"
      @alert_icon = "warning"
    elsif type == "danger"
      @alert_type = "danger"
      @alert_icon = "error_outline"
    end
  end

end