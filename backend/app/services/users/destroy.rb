# frozen_string_literal: true

module Users
  class Destroy
    def call(id)
      @user = User.find(id)
      delete_user
    rescue ActiveRecord::RecordNotFound then false
    end

    private

    def delete_user
      @user.destroy
      @user.destroyed?
    end
  end
end
