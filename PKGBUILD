# http://github.com/dwoffinden/fortune-mod-farscape

pkgname=fortune-mod-farscape
pkgver=r1678980
pkgrel=1
pkgdesc='Fortune cookies: Farscape (TV series), scraped from wikiquotes.org'
arch=('any')
url='https://en.wikiquote.org/wiki/Farscape'
license=('CC-BY-SA')
makedepends=('perl' 'perl-mediawiki-api' 'perl-libwww')
depends=('fortune-mod')
groups=('fortune-mods')
source=('wiki.pl')
md5sums=('db6056315ab6885c552129ca6c5388c1')

pkgver() {
  cd "$srcdir"
  printf "r%s" $(perl wiki.pl revision)
}

build() {
  cd "$srcdir"
  perl wiki.pl > farscape
  strfile farscape farscape.dat
}

package() {
  cd "$srcdir"
  install -D -m644 farscape ${pkgdir}/usr/share/fortune/farscape
  install -D -m644 farscape.dat ${pkgdir}/usr/share/fortune/farscape.dat
}
