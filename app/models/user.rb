class User < ApplicationRecord   
    has_many :gossips
    belongs_to :city, optional: true
    has_secure_password
      validates :password, presence:true,length:{minimum:6}
      validates :email,
        presence: true,
        uniqueness: true,
        format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }

     
    # validates :first_name,presence: true
    # validates :last_name,presence: true
    # validates :description,presence: true   
    # validates :age,presence: true
    
    
       
end
 