control 'PHTN-67-000027' do
  title "The Photon operating system must be configured so that passwords for
new users are restricted to a 24-hour minimum lifetime."
  desc  "Enforcing a minimum password lifetime helps to prevent repeated
password changes to defeat the password reuse or history enforcement
requirement. If users are allowed to immediately and continually change their
password, the password could be repeatedly changed in a short period of time to
defeat the organization's policy regarding password reuse."
  desc  'rationale', ''
  desc  'check', "
    At the command line, execute the following command:

    # grep \"^PASS_MIN_DAYS\" /etc/login.defs

    If PASS_MIN_DAYS is not set to 1, this is a finding.
  "
  desc 'fix', "
    Open /etc/login.defs with a text editor. 

    Modify the PASS_MIN_DAYS line to the following:

    PASS_MIN_DAYS   1
  "
  impact 0.5
  tag severity: 'medium'
  tag gtitle: 'SRG-OS-000075-GPOS-00043'
  tag gid: 'V-239099'
  tag rid: 'SV-239099r675105_rule'
  tag stig_id: 'PHTN-67-000027'
  tag fix_id: 'F-42269r675104_fix'
  tag cci: ['CCI-000198']
  tag nist: ['IA-5 (1) (d)']

  describe login_defs do
    its('PASS_MIN_DAYS') { should cmp '1' }
  end
end
