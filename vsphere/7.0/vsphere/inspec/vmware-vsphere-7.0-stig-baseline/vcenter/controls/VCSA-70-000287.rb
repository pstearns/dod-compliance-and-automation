# -*- encoding : utf-8 -*-
control "VCSA-70-000287" do
  title "The vCenter Server must have new Key Encryption Keys (KEKs) re-issued at regular intervals for vSAN encrypted datastore(s)."
  desc  "
    The Key Encryption Key (KEK) for a vSAN encrypted datastore is generated by the Key Management Server (KMS) and serves as a wrapper and lock around the Disk Encryption Key (DEK). The DEK is generated by the host and is used to encrypt and decrypt the datastore. A shallow re-key is a procedure in which the KMS issues a new KEK to the ESXi host which re-wraps the DEK but does not change the DEK or any data on disk.
    
    This operation must be done on a regular, site defined interval and can be viewed as similar in criticality to changing an administrative password. Should the KMS itself somehow be compromised, a standing operational procedure to re-key will put a time limit on the usefulness of any stolen KMS data.
  "
  desc  "rationale", ""
  desc  "check", "
    If vSAN is not in use, this is Not Applicable.
    
    Interview the SA to determine that a procedure has been put in place to perform a shallow re-key of all vSAN encrypted datastores at regular, site defined intervals.
    
    VMware recommends a 60-day re-key task but this interval must be defined by the SA and the ISSO.
    
    If vSAN encryption is not in use, this is not a finding.
  "
  desc  "fix", "If vSAN encryption is in use, ensure that a regular re-key procedure is in place."
  impact 0.7
  tag severity: "high"
  tag gtitle: "SRG-APP-000516"
  tag gid: nil
  tag rid: nil
  tag stig_id: "VCSA-70-000287"
  tag cci: ["CCI-000366"]
  tag nist: ["CM-6 b"]

  describe "This check is a manual or policy based check" do
    skip "This must be reviewed manually"
  end
end