class UsersPerm
  attr_reader :user

    def initialize(user)
      @user = user
    end

    def can_edit?(article)
    end

    def can_del?(article)

    end

end
