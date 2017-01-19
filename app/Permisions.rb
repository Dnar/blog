module Permissions
  class UsersPerm
    attr_reader :user

      def initialize(user)
        @user = user
      end

      def can_edit?(article)
        article.user_id == @user.id
      end

      def can_del?(article)
        article.user_id == @user.id
      end

  end
end
