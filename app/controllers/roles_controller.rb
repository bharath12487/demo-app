class RolesController < ApplicationController
    def index
        roles = Role.order('created_at DESC')
        render json: {status: "SUCCESS", data: roles}, status: :ok
    end

end
