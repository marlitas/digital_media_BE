require 'rails_helper'

RSpec.describe 'Direct Upload Requests' do
    it 'can send presigned url' do
        post '/api/v1/presigned_url', params: {
            "file": {
            "filename": "test_upload",
            "byte_size": 369830,
            "checksum": "jTLf6PNJHAxraPivOUT0lg==",
            "content_type": "image/png",
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

        @url = res['direct_upload']['url']
        @headers = res['direct_upload']['headers']
    end

    xit 'can create a direct upload' do
       put "#{@url}", params: {

       },
       headers: @headers
    end
end