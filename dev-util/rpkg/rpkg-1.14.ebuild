# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils bash-completion-r1

DESCRIPTION="Utility for interacting with rpm+git packaging systems"
HOMEPAGE="https://fedorahosted.org/rpkg"
SRC_URI="https://fedorahosted.org/releases/${PN:0:1}/${PN:1:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-2 LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-python/git-python
	virtual/python-argparse
	dev-python/pycurl
	dev-util/koji
	app-arch/rpm[python]
	dev-util/rpmlint
	dev-util/mock
	net-misc/curl
	dev-python/kitchen
	net-misc/openssh"
DEPEND="
	dev-python/setuptools
	dev-python/git-python
	dev-python/pycurl
	dev-util/koji
	virtual/python-argparse
	dev-python/kitchen"

src_install() {
	distutils_src_install
	rm -rf "${D}"etc/bash_completion.d || die
	newbashcomp src/rpkg.bash ${PN}
}
