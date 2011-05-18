module MCollective
  module Agent
    class Deploy < RPC::Agent
      metadata :name        => "Deploy",
               :description => "Deployment agent",
               :author      => "Anonymous",
               :version     => "0.1",
               :license     => "private",
               :url         => "http://cn.com",
               :timeout     => 1200

      action "war" do
        validate :source, String
        Log.instance.info "Trying #{request[:source].inspect}"
        `wget #{request[:source]} -O /tmp/ROOT.war`
        `/etc/init.d/tomcat6 stop`
        `rm -r /var/lib/tomcat6/webapps/*`
        `mv /tmp/ROOT.war /var/lib/tomcat6/webapps/ROOT.war`
        `/etc/init.d/tomcat6 start`
      end
    end
  end
end
