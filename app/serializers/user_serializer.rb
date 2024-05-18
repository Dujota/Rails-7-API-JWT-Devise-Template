class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :created_at

  attribute :created_date do |user|
    user.created_at&.strftime('%m/%d/%Y')
  end

  attribute :roles do |user|
    user.roles.map(&:name)
  end

  attribute :profile, if: proc { |user, params|
                            user.profile if params[:include_profile]
                          }
end
