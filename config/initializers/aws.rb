require 'aws-sdk-s3'

Aws.config.update({
  region: ENV['AWS_REGION'],
  credentials: Aws::Credentials.new(ENV['AWS_KEY_ID'], ENV['AWS_SECRET_KEY']),
})

S3_BUCKET = Aws::S3::Resource.new.bucket(ENV['AWS_BUCKET'])