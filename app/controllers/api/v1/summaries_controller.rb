module Api
  module V1
    class SummariesController < BaseController
      before_action :group_by_month

      def months
        render json: { summary: @grouped_by_month }
      end

      def categories
      end

      private

      def group_by_month
        month_processor = MonthProcessorService.new
        @grouped_by_month = month_processor.process
      end
    end
  end
end
