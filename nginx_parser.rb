class NginxParser < Parser
  # matches the following log format
  # log_format  main  '$remote_addr $host $remote_user [$time_local] "$request" $status $body_bytes_sent "$http_referer" "$http_user_agent" $ssl_cipher $request_time';
  
  attr_reader :ip, :domain, :user, :time,
              :request_type, :status, :bytes_sent,
              :referer, :user_agent, :ssl_cipher, :time_taken

  NGINX_REGEX = /\[(.*)\] (\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b) ([^\s]*) ([^\s]*) \[(.*)\] "([^"]*)" ([\d]*) ([\d]*) "([^"]*)" "([^"]*)" ([^\s]*) ([\d\.]*)/
  
  def parse
    raw_data =~ NGINX_REGEX
    @ip = $2
    @domain = $3
    @user = $4
    @time = $5
    @request_type = $6
    @status = $7
    @bytes_sent = $8
    @referer = $9
    @user_agent = $10
    @ssl_cipher = $11
    @time_taken = $12
  end
end
