require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'relationships' do

  end

  describe 'students' do
    it 'can add new student' do
      student = Student.create(name: 'Bert', about: "I'm a student", major: 'DNCE', enrolled: true)

      expect(Student.all.length).to eq(1)
    end
  end
end