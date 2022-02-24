class StudentSerializer
  include JSONAPI::Serializer
  attributes :name, :about, :major, :enrolled, :code

  def self.new_avatar(student)
    {
      'id': student.id,
      'attributes': {
        'name': student.name,
        'enrolled': student.enrolled,
        'avatar_url': student.avatar_url
      }
    }
  end
end
