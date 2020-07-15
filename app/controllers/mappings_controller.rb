class MappingsController < ApplicationController
    def index
        mappings = Mapping.order('created_at DESC')
        render json: {status: "SUCCESS", data: mappings}, status: :ok
    end

end
