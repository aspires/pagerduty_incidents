require "httparty"
require "pp"
class Pagerduty
  include HTTParty
  
  def initialize(s,u,p)
    # should pass in siteurl, username, and password
    self.class.base_uri "#{s.strip}.pagerduty.com/api/v1"
    self.class.basic_auth(u.strip, p.strip)
  end

  def incidents()
    self.class.get("/incidents")["incidents"]
  end

  def unresolved
    self.class.get("/incidents?status=unresolved")["incidents"]
  end
  
  def resolved 
    self.class.get("/incidents?status=resolved")["incidents"]
  end
end

test = Pagerduty.new("aspires", "austinspires@gmail.com", "pagerdutypassword")

test.incidents.each do |f|
  pp f
  puts "------incident-----------------"
end

test.unresolved.each do |d|
  pp d
  puts "------unresolved-------------------"
end

test.resolved.each do |r|
 pp r
 puts "------resolved----------------------------"
end
