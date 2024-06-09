# frozen_string_literal: true

module Users
  class Update < Core::Service
    def call(id, params)
      @user = User.find(id)
      @params = params
      update_user
    rescue ActiveRecord::RecordNotFound then false
    end

    private

    def update_user
      @user.update(@params)
    end
  end
end
