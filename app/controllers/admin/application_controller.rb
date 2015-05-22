module Admin
  class ApplicationController < ::ApplicationController
    before_action :authenticate_admin_user!

    private
      def authenticate_admin_user!
        render text: "Forbidden", status: 403 unless current_user.admin?
      end
  end
end
