module Api
  module V1
    class InvoicesController < BaseController
      before_action :find_invoices

      def index
        render json: @invoices
      end

      private

      def find_invoices
        @invoices = Invoice.all
      end
    end
  end
end
