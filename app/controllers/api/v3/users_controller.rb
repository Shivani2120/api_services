  module Api
    module V3
      class UsersController < ApplicationController
        # respond_to :json   #added

        def index
          @users = User.all
          render json: @users
        end

        def create
          begin
            #----------user---------#
            prev_user = User.find_by email: params[:email]
            raise StandardError, "user already exists" if prev_user.present?

            user = User.create(name: params[:name], contact: params[:contact], email: params[:email])
            
            #--------product----------#
            product = Product.find_by name: params[:name]
            raise StandardError, "product doesn't exist" if product.present?
            
            #-------subscription----------#
            sub = Subscription.create(product_id: params[:product_id], user_id: params[:user_id], expires_at: params[:expires_at])
            
            #--------suport--------------#
            suport = Suport.find_by name: "jessica"
            raise StandardError, "Couldn't assign a support person"  unless support.present?

            user.suport_id = suport[:id]
            user.save
            
            #------------metric---------#
            Matric.create(user_count: 1, revenue: product.price)
            
            #-------mailer--------#
            UserMailer.with(user: user).welcome_email.deliver_later
            render json: { user: user, subscription: sub }  

          rescue => exception
            # render json: { error: e }
          end
        end
      end
    end
  end
