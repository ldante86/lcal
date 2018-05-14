use 5.022001;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME          => 'Stardate',
    VERSION_FROM  => 'lib/Stardate.pm',
    PREREQ_PM     => {},
    ABSTRACT_FROM => 'lib/Stardate.pm',
    AUTHOR        => 'Luciano Dante Cecere <ldante1986@gmail.com>',
    LICENSE       => 'perl',
    dist          => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    EXE_FILES     => [qw(bin/stardate.pl)],

);
