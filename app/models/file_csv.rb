class FileCsv < ActiveRecord::Base
  has_attached_file :school_registrations_csv,
                    path: "/file_csv/:id/:filename"
  has_attached_file :users_csv,
                    path: "/file_csv/:id/:filename"
  validates_attachment_content_type :school_registrations_csv, :users_csv, content_type: %w(text/plain text/csv application/vnd.ms-excel)

  def s3_credentials
    { :bucket => "csvupload1992",
      :access_key_id => "AKIAIG4CEJOPCPSCBQXQ", #"AKIAI25EC4FSH7DNSLTA",
      :secret_access_key => "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", #"RtzHp/tBOmOBi2whzHIdquBt4K45GMXmbTixYLHq",
      :s3_region => 'ap-south-1',
      :url => :s3_domain_url,
      :s3_protocol => 'https'
    }
  end
end
