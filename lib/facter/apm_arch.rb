# frozen_string_literal: true

# Fact: apm_arch
#
# Purpose: tells if the node has APM or not
#
# Resolution:
#   Tests for presence of /dev/apm and /dev/apmctl
#   returns true if available, otherwise nil
#
# Caveats:
#   none
#
# Notes:
#   None
Facter.add(:apm_arch) do
  confine operatingsystem: 'OpenBSD'
  has_weight 100
  setcode do
    if File.exist?('/dev/apm') && File.exist?('/dev/apmctl')
      true
    end
  end
end
