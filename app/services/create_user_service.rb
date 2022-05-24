class CreateUserService
    attr_reader :name, :email, :contact
  
    def initialize(name, email, contact)
      @name = name
      @contact = contact
      @email = email
    end
  
    def call
      prev_user = User.find_by email: @email
      raise StandardError, 'User already exists' if prev_user.present?
  
      User.create(name: @name, contact: @contact, email: @email)
    end
  end