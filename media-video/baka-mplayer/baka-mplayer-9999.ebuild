# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit git-2 eutils qmake-utils

DESCRIPTION="Cross-platform libmpv-based multimedia player with uncluttered design"
HOMEPAGE="http://bakamplayer.u8sand.net/"
EGIT_REPO_URI="https://github.com/u8sand/Baka-MPlayer.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtsvg:5
	dev-qt/qtwidgets:5
	dev-qt/qtx11extras:5
	media-video/mpv[libmpv]
	x11-libs/libX11"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

S="${WORKDIR}/Baka-MPlayer-${PV}"

src_prepare() {
	# no need to install license
	sed -e '/^INSTALLS/s:license::' -i src/Baka-MPlayer.pro || die
	# put manual in our docdir
	sed -e '/^manual.path/s:'${PN}':'${PF}':' -i src/Baka-MPlayer.pro || die
}

src_configure() {
	eqmake5 \
		INSTROOT="${D}" \
		CONFIG+=install_translations \
		lrelease="$(qt5_get_bindir)"/lrelease \
		lupdate="$(qt5_get_bindir)"/lupdate \
		src/Baka-MPlayer.pro
}
