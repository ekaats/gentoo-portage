# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Cozy is a modern audiobook player for Linux."
HOMEPAGE="Cozy is a modern audiobook player for Linux."
SRC_URI="https://github.com/geigi/cozy/archive/refs/tags/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="gui-libs/libhandy media-libs/mutagen dev-python/distro dev-python/peewee dev-python/pygobject dev-libs/granite"
RDEPEND="${DEPEND}"
BDEPEND="dev-util/meson x11-libs/gtk+ dev-python/pkgconfig gui-libs/gtk:4 dev-libs/libdazzle"

PATCHES=(
	"${FILESDIR}"/"${PN}"-no-gnome-install.patch
)

src_configure() {
#        local emesonargs=(
#		$(Dprefix="/opt/cozy")
#               $(meson_use qt5)
#               $(meson_feature threads)
#               $(meson_use bindist official_branding)
#        )
        meson_src_configure
#	ninja -C $BUILDDIR install
}



# pkg_preinst() {
	# ninja -C $WORKDIR com.github.geigi.cozy-update-po
	# ninja -C $WORKDIR extra-update-po
# }

pkg_postinst() {
	xdg_desktop_database_update
}
