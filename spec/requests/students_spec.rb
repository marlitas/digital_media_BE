require 'rails_helper' 

RSpec.describe 'Student Requests' do
  describe 'show' do
    before :each do
      @s1 = create(:student)
      @s2 = create(:student)
      @s3 = create(:student)
    end

    it 'can return individual student' do
      get "/api/v1/students/#{@s1.name}"

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
        expect(student['attributes']['enrolled']).to be(true)
        expect(student['attributes']).to have_key('code')
        expect(student['attributes']).to have_key('video')
      end
    end
  end

  describe 'create' do
    before :each do
      # post '/api/v1/presigned_url', params: {
      #       "file": {
      #       "filename": "test_upload",
      #       "byte_size": 369830,
      #       "checksum": "jTLf6PNJHAxraPivOUT0lg==",
      #       "content_type": "image/png",
      #       "metadata": {
      #           "message": "active_storage_test"
      #       }
      #       }
      #   }

      # @res = JSON.parse(response.body)

      # let(:avatar) { fixture_file_upload('../../assets/Performers without borders image.png')}

      # put @res['direct_upload']['url'], params: avatar, headers: @res['direct_upload']['headers']
    end

    xit 'can create new student' do 
      post '/api/v1/students', params: {
        "name": "Sparky Testerson",
        "enrolled": true,
        "about": "I like treats",
        "major": "dog",
        "avatar": 'eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBCZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--b4c897d77ef5bfe3be2e589428ff27a6ef6e18cb'
      }

      student_res = JSON.parse(response.body)

      expect(student_res).to have_key('id')
      expect(student_res).to have_key('attributes')
      expect(student_res['attributes']).to have_key('enrolled')
      expect(student_res['attributes']['enrolled']).to be(true)
      expect(student_res['attributes']).to have_key('name')
      expect(student_res['attributes']['name']).to be_a(String)
      expect(student_res['attributes']).to have_key('avatar_url')
    end
  end

  xit 'can update a student' do 
    put '/api/v1/students', params: {
      "name": "Sparky Testerson",
      "enrolled": false,
      "about": "I'm a really cool doggo",
      "major": "bones",
      "avatar": 'eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBCZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--b4c897d77ef5bfe3be2e589428ff27a6ef6e18cb'
    }

    student_res = JSON.parse(response.body)

    expect(student_res).to have_key('id')
    expect(student_res).to have_key('attributes')
    expect(student_res['attributes']).to have_key('enrolled')
    expect(student_res['attributes']['enrolled']).to be(false)
    expect(student_res['attributes']).to have_key('name')
    expect(student_res['attributes']['name']).to be_a(String)
    expect(student_res['attributes']).to have_key('avatar_url')
  end
end