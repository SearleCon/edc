class DropBoxClient
  def initialize(user)
    @client =  Dropbox::API::Client.new token: user.drop_box_key, secret: user.drop_box_secret
  end

  def upload(file_name, path_to_file)
    @client.upload file_name, File.read(path_to_file)
  end

  def get_file(name)
    result = @client.find name
    nil unless result.is_dir
  end

  def get_directory(name)
     result = (@client.find name)
      nil unless result.is_dir
  end

  def get_files(directory = '')
    (@client.ls directory).select{ |objects| !objects.is_dir }
  end

  def get_directories(directory = '')
    (@client.ls directory).select{ |objects| objects.is_dir }
  end

  def new_directory(name)
    (@client).mkdir name
  end

end