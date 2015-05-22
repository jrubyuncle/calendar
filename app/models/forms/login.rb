module Forms
  class Login
    include ActiveModel::Model

    attr_accessor :email, :password, :user

    validate :authenticate_user

    def initialize(opts = {})
      super
      self.user = User.find_by(email: email)
    end

    private

      def authenticate_user
        p user
        unless user.try(:authenticate, password)
          errors.add(" ", I18n.t(:invalid_email_or_password))
        end
      end
  end
end