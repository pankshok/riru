# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="A Python module with a set of basic tools for writing system utilities"
HOMEPAGE="https://github.com/KonishchevDmitry/psys"
SRC_URI="https://github.com/KonishchevDmitry/${PN}/archive/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

BDEPEND="${PYTHON_DEPS}"
RDEPEND="
	${PYTHON_DEPS}
	dev-python/pcore[${PYTHON_USEDEP}]"