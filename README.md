# bosh-trend-agent-release

bosh create-release --force --version=latest
bosh upload-release
bosh create-release --force --version=latest --tarball=trend-agent.tar

$ bosh create-release --tarball=~/Downloads/blah.tgz

https://bosh.io/docs/windows-sample-release/
https://www.cloudfoundry.org/blog/create-lean-bosh-release/
https://kiennt.com/blog/2012/06/29/run-program-and-generate-pid.html
https://www.xarg.org/2009/10/write-a-pid-file-in-bash/
https://stackoverflow.com/questions/637827/redirect-stderr-and-stdout-in-bash
