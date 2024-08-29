class Room < ApplicationRecord
    belongs_to :user
    validates :name, presence: true
    validates :info, presence: true
    validates :price, presence: true
    validates :price, numericality: {only_integer: true, greater_than: 0} 
    validates :address, presence: true
    mount_uploader :image, RoomUploader 
end
