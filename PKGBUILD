# Maintainer: mar77i <mar77i at mar77i dot ch>
# Past Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Scytrin dai Kinthra <scytrin@gmail.com>
# Scrollback-vim and inconsolata patches added by katie-jones

pkgname=st-patched
_pkgname=st
pkgver=0.7.16.ge448324
pkgrel=1
pkgdesc='Simple virtual terminal emulator for X'
url='http://st.suckless.org/'
arch=('i686' 'x86_64')
license=('MIT')
options=('zipman')
depends=('libxft')
makedepends=('ncurses' 'libxext' 'git')
epoch=1
# include config.h and any patches you want to have applied here
source=('git://git.suckless.org/st'
    'http://st.suckless.org/patches/st-clipboard-20160727-308bfbf.diff'
    st-inconsolata-20160807-308bfbf.diff
    'http://st.suckless.org/patches/st-no_bold_colors-20160727-308bfbf.diff'
    st-scrollback-vim-20161126-e448324.diff
    st-solarized-both-20161126-e448324.diff
    'http://st.suckless.org/patches/st-visualbell-20160727-308bfbf.diff')

sha1sums=('SKIP'
          '18037d96608d032dadc8f3bf1f9e788f731fb676'
          '227dfde41a7d18d59bf3a629f28fb6e58d14578d'
          'd089f953f091933fa867416648d497a87bde3461'
          'd8c13e4a2e6e9abd9946841e3392e8686d5948d8'
          'eabe7d15826513349f74b52dc342bb0fa2a6413e'
          '9ce285628092e232edf971a65995fe797ee0bc43')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${_pkgname}"
	git describe --tags |sed 's/-/./g'
}

prepare() {
	local file
	cd "${_pkgname}"
	sed \
		-e 's/CPPFLAGS =/CPPFLAGS +=/g' \
		-e 's/CFLAGS =/CFLAGS +=/g' \
		-e 's/LDFLAGS =/LDFLAGS +=/g' \
		-e 's/_BSD_SOURCE/_DEFAULT_SOURCE/' \
		-i config.mk
	sed '/@tic/d' -i Makefile

	for file in "${source[@]}"; do
		if [[ "$file" == "config.h" ]]; then
			# add config.h if present in source array
			# Note: this supersedes the above sed to config.def.h
			cp "$srcdir/$file" .
		elif [[ "$file" == *.diff || "$file" == *.patch ]]; then
			# add all patches present in source array
            echo "$file"
			patch -Np1 <"$srcdir/$(basename ${file})"
		fi
	done
}

build() {
	cd "${_pkgname}"
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd "${_pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
