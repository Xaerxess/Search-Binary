#
# $Id: Makefile.PL,v 1.1 1998/12/01 08:36:23 rantapaa Exp $
#

use ExtUtils::MakeMaker;

require 5.002 ;

WriteMakefile(
	NAME      => 'Search::Binary',
	VERSION_FROM   => 'lib/Search/Binary.pm',
	'linkext'   => {LINKTYPE => ''},
	'dist'    =>    {COMPRESS=>'gzip', SUFFIX=>'gz'},
	) ;
