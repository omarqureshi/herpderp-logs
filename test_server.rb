require 'parser'
require 'nginx_parser'

require 'minitest/autorun'

describe NginxParser do

  before do
    @log_line = '[en-staging-app-nginx] 10.183.252.26 staging.edisonnation.com edison [11/Sep/2012:08:13:04 -0500] "GET / HTTP/1.1" 200 5793 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.89 Safari/537.1" - 8.287'
    @parser = NginxParser.new(@log_line)
  end
  
  describe 'when given a line with an nginx log prefixed with the hostname + log type' do
    
    it 'should have an ip address of 10.183.252.26' do
      @parser.ip.must_equal('10.183.252.26')
    end

    it 'should have a domain of staging.edisonnation.com' do
      @parser.domain.must_equal('staging.edisonnation.com')
    end

    it 'should have a remote user of edison' do
      @parser.user.must_equal('edison')
    end

    it 'must have a time of 11/Sep/2012:08:13:04 -0500' do
      @parser.time.must_equal('11/Sep/2012:08:13:04 -0500')
    end

    it 'must have a request type of GET / HTTP/1.1' do
      @parser.request_type.must_equal('GET / HTTP/1.1')
    end

    it 'must have a status of 200' do
      @parser.status.must_equal('200')
    end

    it 'must have a bytes sent of 5793' do
      @parser.bytes_sent.must_equal('5793')
    end

    it 'must have a referer of -' do
      @parser.referer.must_equal('-')
    end

    it 'must have a user agent set' do
      @parser.user_agent.must_equal('Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.89 Safari/537.1')
    end

    it 'must have an ssl cipher of -' do
      @parser.ssl_cipher.must_equal('-')
    end

    it 'must have an ssl cipher of -' do
      @parser.time_taken.must_equal('8.287')
    end

    
  end
  
end
