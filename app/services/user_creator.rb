class UserCreator
    def initialize(name:, contact:, email:)
      @name = name
      @contact = contact
      @email = email
    end
     
    def call
        create_user
    end

    private
    def create_user
      User.create!(
      name: @name,
      contact: @contact,
      email: @email
      )
    end
end