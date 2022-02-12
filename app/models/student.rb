class Student < ApplicationRecord
    has_one_attached :avatar
    has_one_attached :midterm
    has_one_attached :installation

    def avatar_url
        if avatar.attached?
            avatar.blob.service_url
        end
    end

    def midterm_url

    end

    def installation_url

    end
end
