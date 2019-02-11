class HomeController < ApplicationController
  def index
    @csvs = FileCsv.all
  end

  def upload_csv_files
    file_csv = FileCsv.create params.permit(:school_registrations_csv, :users_csv)
    if file_csv.save
      redirect_to root_path
    else
      render :new
    end
  end

  def import_to_active_record
    file = FileCsv.where(id: params[:id])[0]
    @errors = []
    # initial Count
    @user_before_import = User.count
    @school_registration_before_import = SchoolRegistration.count
    # Fetching and importing records
    users = read_csv_file file.users_csv.url
    import_users users
    school_registrations = read_csv_file file.school_registrations_csv.url
    import_school_registrations school_registrations
    # Final Count
    @total_csv_records_user = users.length
    @total_csv_records_school_registration = school_registrations.length
    @user_after_import = User.count
    @school_registration_after_import = SchoolRegistration.count
    @no_of_users_imported = @user_after_import - @user_before_import
    @no_of_school_registration_imported = @school_registration_after_import - @school_registration_before_import
    render :import_to_active_record, formats: [:txt]
  end

  private

  def read_csv_file url
    open('read.csv', 'wb') do |file|
      file << open(url).read
    end
    SmarterCSV.process('read.csv' )
  end

  def import_users users
    users.each do |json|
      user = User.new email: json[:email], first_name: json[:first_name], last_name: json[:last_name]
      unless user.save
        @errors << "User id #{json[:user_id]}, user could not be imported because: #{user.errors.full_messages[0]}"
      end
    end
  end

  def import_school_registrations school_registrations
    school_registrations.each do |json|
      english = json[:class].include? 'English'
      geography = json[:class].include? 'Geography'
      spanish = json[:class].include? 'Spanish'
      school_registration = SchoolRegistration.new school: json[:school], english: english, geography: geography, spanish: spanish
      unless school_registration.save
        @errors << "User id #{json[:user_id]}, class could not be imported because: #{school_registration.errors.full_messages[0]}"
      end
    end
  end
end
