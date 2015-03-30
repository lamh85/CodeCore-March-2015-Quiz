class Request < ActiveRecord::Base

  validates :name, presence: { message: "Name is required"}

  validates :email, presence: { message: "Email is required"}

  def self.search(search_term)
    Request.where("name ILIKE ? OR email ILIKE ? OR message ILIKE ?", 
                        "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")
  end

end
