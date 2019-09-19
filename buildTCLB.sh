#/bin/bash
REPO=mdzik/TCLB.git
BRANCH="d3q27_csf"
BUILD="180.10" #check this on travis site, only second number is important (model)
set -e
set -x
cd /
rm -rf ~/build
rm -rf TCLB_build
mkdir TCLB_build
cd TCLB_build
git clone --branch=$BRANCH  https://github.com/$REPO
cd TCLB
##cd $(echo $REPO | sed 's/\.git//g')
~/.travis/travis-build/bin/travis compile --skip-version-check --skip-completion-check -r $REPO --no-interactive $BUILD > run.sh
cd /TCLB_build
cat TCLB/run.sh | sed "s/--branch\\\\=\\\\'\\\\/--branch\\\\=\\\\'$BRANCH\\\\/g" > TCLB/run2.sh
bash TCLB/run2.sh
