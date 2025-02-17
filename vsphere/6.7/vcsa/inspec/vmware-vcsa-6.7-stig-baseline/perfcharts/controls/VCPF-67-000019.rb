control 'VCPF-67-000019' do
  title 'Performance Charts must set "URIEncoding" to UTF-8.'
  desc  "Invalid user input occurs when a user inserts data or characters into
a hosted application's data entry field and the hosted application is
unprepared to process that data. This results in unanticipated application
behavior, potentially leading to an application compromise. Invalid user input
is one of the primary methods employed when attempting to compromise an
application.

    An attacker can also enter Unicode characters into hosted applications in
an effort to break out of the document home or root home directory or to bypass
security checks. Performance Charts must be configured to use a consistent
character set via the \"URIEncoding\" attribute on the Connector nodes.
  "
  desc  'rationale', ''
  desc  'check', "
    At the command prompt, execute the following command:

    # xmllint --xpath '/Server/Service/Connector/@URIEncoding'
/usr/lib/vmware-perfcharts/tc-instance/conf/server.xml

    Expected result:

    URIEncoding=\"UTF-8\"

    If the output does not match the expected result, this is a finding.
  "
  desc 'fix', "
    Navigate to and open /usr/lib/vmware-perfcharts/tc-instance/conf/server.xml.

    Configure the <Connector> node with the value 'URIEncoding=\"UTF-8\"'.
  "
  impact 0.5
  tag severity: 'medium'
  tag gtitle: 'SRG-APP-000251-WSR-000157'
  tag gid: 'V-239420'
  tag rid: 'SV-239420r674983_rule'
  tag stig_id: 'VCPF-67-000019'
  tag fix_id: 'F-42612r674982_fix'
  tag cci: ['CCI-001310']
  tag nist: ['SI-10']

  describe xml("#{input('serverXmlPath')}") do
    its(['Server/Service/Connector/@URIEncoding']) { should cmp "#{input('uriEncoding')}" }
  end
end
