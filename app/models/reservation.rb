class Reservation < ApplicationRecord
    belongs_to :user
    validates :check_in, presence:true
    validates :check_out, presence:true
    validates :persons, presence: true, 
                        numericality: {only_integer: true, greater_than: 0}
    validate :validate_past, :not_past, if: :not_nil
        def validate_past
            if check_in > check_out
                errors.add(:check_in, "はチェックアウトより前にできません")
            end
        end
        def not_past
            if check_in < Date.current
                errors.add(:check_in, "は今日より前にできません")
            end
        end
        def not_nil
            check_in != nil && check_out != nil
        end
end
 