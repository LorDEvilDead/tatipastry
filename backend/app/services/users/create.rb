# # frozen_string_literal: true

# module Api
#   module V1
#     module Users
#       class Create < Core::Service
#         def call(params)
#           @params = params
#           user.save ? UsersSerializer.new(user).serializable_hash[:data][:attributes] : false
#         end

#         private

#         def user
#           @user ||= User.new(@params)
#         end
#       end
#     end
#   end
# end
