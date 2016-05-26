module Api
  module V1
    class SummariesController < BaseController
      before_action :group_by_month, only: [:months]
      before_action :group_by_category, only: [:categories]

      def months
        render json: { summary: @grouped_by_month }
      end

      def categories
        render json: { summary: @grouped_by_category }
      end

      private

      def group_by_month
        month_processor = MonthProcessorService.new
        @grouped_by_month = month_processor.process
      end

      def group_by_category
        category_processor = CategoryProcessorService.new
        @grouped_by_category = category_processor.process
      end
    end
  end
end
