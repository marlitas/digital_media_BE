class StudentSerializer
  include JSONAPI::Serializer
  attributes :name, :about, :major, :enrolled, :code
end
