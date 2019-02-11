Paperclip::Attachment.default_options.merge!({
                                                 :storage => :s3,
                                                 :s3_credentials => {
                                                     :bucket => "csvupload1992",
                                                     :access_key_id => "AKIAIG4CEJOPCPSCBQXQ",
                                                     :secret_access_key => "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",
                                                     :s3_region => 'ap-south-1'
                                                 },
                                                 :bucket => "csvupload1992",
                                                 :url => ":s3_domain_url",
                                                 :s3_headers => {'Cache-Control' => 'max-age=2147483648'},
                                                 :s3_protocol => :https,
                                                 :s3_host_alias => "cdn.mydomain.com",
                                             })