module MCollective
  module Agent
    class Deploy < RPC::Agent
      metadata :name        => "Deploy",
               :description => "Deployment agent",
               :author      => "Anonymous",
               :version     => "0.1",
               :license     => "private",
               :url         => "http://cn.com",
               :timeout     => 600

      action "war" do
        validate :source, String
        `wget #{request[:source]} -O /tmp/app.war`
        `/etc/init.d/tomcat6 stop`
        `rm -r /var/lib/tomcat6/webapps/*`
        `mv /tmp/app.war /var/lib/tomcat6/webapps/ROOT.war`
        `/etc/init.d/tomcat6 start`
      end
    end
  end
end
