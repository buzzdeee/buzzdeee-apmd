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
#   There are architectures that support APM, but
#   not every platform supports it, so it may give
#   a false positive.
#
# Notes:
#   None
Facter.add(:apm_arch) do
  confine operatingsystem: 'OpenBSD'
  has_weight 100
  setcode do
    File.exist?('/dev/apm') && File.exist?('/dev/apmctl') && true
  end
end
