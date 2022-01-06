require 'rails_helper' 

RSpec.describe 'Student Requests' do
  describe 'show' do
    before :each do
      @s1 = create(:student)
      @s2 = create(:student)
      @s3 = create(:student)
    end

    it 'can return individual student' do
      get "/api/v1/students/#{@s1.id}"

      res = JSON.parse(response.body)

      expect(res).to be_a(Hash)
      expect(res['data']).to have_key('id')
      expect(res['data']['id']).to eq(@s1.id)
      expect(res['data']).to have_key('attributes')
      expect(res['data']['attributes']).to be_a(Hash)
      
      expect(res['data']['attributes']).to have_key('name')
      expect(res['data']['attributes']['name']).to eq(@s1.name)
      expect(res['data']['attributes']).to have_key('about')
      expect(res['data']['attributes']['about']).to eq(@s1.about)
      expect(res['data']['attributes']).to have_key('major')
      expect(res['data']['attributes']['major']).to eq(@s1.major)
      expect(res['data']['attributes']).to have_key('enrolled')
      expect(res['data']['attributes']['enrolled']).to be(true)
    end

    it 'can send array of students' do

    end
  end
end