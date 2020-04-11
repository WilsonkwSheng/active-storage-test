module RemoveUploadedFilesHelpers
  def after_teardown
    super
    remove_uploaded_files
  end

  private

  def remove_uploaded_files
    FileUtils.rm_rf(Rails.root.join('tmp', 'rspec_storage'))
  end
end

RSpec.configure do |config|
  config.include(RemoveUploadedFilesHelpers)
end
