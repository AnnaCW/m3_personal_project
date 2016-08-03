class PermissionsService

  def initialize(user, controller, action)
    @_controller = controller
    @_action     = action
    @_user       = user || User.new
  end

  def allow?
    if user.admin?
      admin_permissions
    else
      other_user_permissions
    end
  end

  private
    def controller
      @_controller
    end

    def action
      @_action
    end

    def user
      @_user
    end

    def admin_permissions
      return true if controller == 'admin/listening_sessions' && action.in?(%w(index))
      return true if controller == 'admin/data_export' && action.in?(%w(index))

      return true if controller == 'api/v1/listening_sessions' && action.in?(%w(create update destroy))
      return true if controller == 'api/v1/suggestions' && action.in?(%w(index))
      return true if controller == 'artists' && action.in?(%w(show))
      return true if controller == 'categories' && action.in?(%w(index show))
      return true if controller == 'items' && action.in?(%w(show))
      return true if controller == 'listening_sessions' && action.in?(%w(index))
      return true if controller == 'suggestions' && action.in?(%w(index))
      return true if controller == 'sessions' && action.in?(%w(create destroy))
      return true if controller == 'suggestions' && action.in?(%w(show))
      return true if controller == 'welcome' && action.in?(%w(index))
    end

    def other_user_permissions
      return true if controller == 'api/v1/listening_sessions' && action.in?(%w(create update destroy))
      return true if controller == 'api/v1/suggestions' && action.in?(%w(index))
      return true if controller == 'artists' && action.in?(%w(show))
      return true if controller == 'categories' && action.in?(%w(index show))
      return true if controller == 'items' && action.in?(%w(show))
      return true if controller == 'listening_sessions' && action.in?(%w(index))
      return true if controller == 'suggestions' && action.in?(%w(index))
      return true if controller == 'sessions' && action.in?(%w(create destroy))
      return true if controller == 'suggestions' && action.in?(%w(show))
      return true if controller == 'welcome' && action.in?(%w(index))
    end
end
