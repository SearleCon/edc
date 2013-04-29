class DropBoxClient

  def initialize(user)
    @client =  Dropbox::API::Client.new :token => user.token, :secret => user.secret
  end

  def download(file_name)
    @client.download file_name
  end

  def upload(file_name, path_to_file)
    @client.upload file_name, File.read(path_to_file)
  end

end