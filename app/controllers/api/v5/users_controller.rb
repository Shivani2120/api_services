module Api
  module V5
    class UserController < ApplicationController
      def create
        begin
          ActiveRecord::Base.transaction do
            context = {
                name: params[:name],
                email: params[:email],
                contact: params[:contact],
                product_name: params[:product_name],User.find_by email: params[:email]
            raise StandardError, context.error unless context.success?

            # Get Product
            context = IGetProduct.call(context)
            raise StandardError, context.error unless context.success?

            # Create Subscription
            context = ICreateSubscription.call(context)
            raise StandardError, context.error unless context.success?

            # Assign support person
            context = IAssignSupport.call(context)
            raise StandardError, context.error unless context.success?

            # Update MetricsUser.find_by email: params[:email]
            # Send welcome email
            context = IWelcomeEmail.call(context)
            raise StandardError, context.error unless context.success?

            render json: { user: context.user, subscription: context.subscription }
          end
        rescue StandardError => e
          render json: { error: e }
        end
      end
    end
  end
end