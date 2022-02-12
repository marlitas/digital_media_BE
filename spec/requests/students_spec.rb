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
      expect(res['data']['id']).to eq("#{@s1.id}")
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
      expect(res['data']['attributes']).to have_key('code')
      expect(res['data']['attributes']['code']).to eq(nil)
    end

    it 'can send array of students' do
      get '/api/v1/students'

      res = JSON.parse(response.body)

      expect(res).to be_a(Hash)
      expect(res['data']).to be_an(Array)
      res['data'].each do |student|
        expect(student).to be_a(Hash)
        expect(student).to have_key('id')
        expect(student['id']).to be_a(String)
        expect(student).to have_key('attributes')
        expect(student['attributes']).to be_a(Hash)
        expect(student['attributes']).to have_key('name')
        expect(student['attributes']['name']).to be_a(String)
        expect(student['attributes']).to have_key('about')
        expect(student['attributes']['about']).to be_a(String)
        expect(student['attributes']).to have_key('major')
        expect(student['attributes']['major']).to be_a(String)
        expect(student['attributes']).to have_key('enrolled')
        expect(student['attributes']['enrolled']).to be_in([true, false])
        expect(student['attributes']).to have_key('code')
      end
    end

    it 'can send presigned url' do
      post '/api/v1/presigned_url', body: {
        "file": {
          "filename": "test_upload",
          "byte_size": 1111,
          "checksum": "asdiohas",
          "content_type": "application/pdf",
          "metadata": {
            "message": "active_storage_test"
          }
        }
      }

      res = JSON.parse(response.body)

      expect(res).to be_a(Hash)
      expect(res).to have_key("direct_upload") 
      expect(res).to have_key("blob_signed_id") 
      expect(res['direct_upload']).to be_a(Hash)
      expect(res['direct_upload']).to have_key("url")
      expect(res['direct_upload']).to have_key("headers")
      expect(res['direct_upload']['headers']).to be_a(Hash)
    end
  end
end