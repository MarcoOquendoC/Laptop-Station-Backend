class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  # def create
  #   @user = current_user.new(user_params)

  #   if @user.save
  #     render json: @user, status: 'Successfully created'
  #   else
  #     render json: @user.error, status: 'User could not be created successfully'
  #   end
  # end

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: {
        status: { code: 200, message: 'Signed up sucessfully.' },
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }
    else
      render json: {
        status: { message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}" }
      }, status: :unprocessable_entity
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
