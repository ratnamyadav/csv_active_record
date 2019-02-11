Paperclip::Attachment.default_options.merge!({
                                                 :storage => :s3,
                                                 :s3_credentials => {
                                                     :bucket => "your_bucket",
                                                     :access_key_id => "access_id",
                                                     :secret_access_key => "secret_key",
                                                     :s3_region => 'region'
                                                 },
                                                 :bucket => "csvupload1992",
                                                 :url => ":s3_domain_url",
                                                 :s3_headers => {'Cache-Control' => 'max-age=2147483648'},
                                                 :s3_protocol => :https,
                                                 :s3_host_alias => "cdn.mydomain.com",
                                             })