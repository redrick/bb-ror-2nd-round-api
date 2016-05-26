module Api
  module V1
    class HelloWorldController < BaseController
      def index
        render json: { content: 'Hello World!' }
      end
    end
  end
end
