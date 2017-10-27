#!/bin/sh -

VERSION=0.0.1
GEM=rcal-${VERSION}.gem

iman()
{
    local manfile="${1}"
    local section=${2:-1}
    if [ -z ${manfile} ]; then
        echo Usage: ${FUNCNAME} file.1[.gz] section-number
        return 1
    else
        if [ ! -e ${manfile} ]; then
            echo ${manfile} not found
            return 1
        else
            case ${1} in 
                *.[1-9])
                    /bin/gzip ${1};
                    sudo cp ${manfile}.gz /usr/share/man/man${section}
                    /bin/gunzip ${manfile}.gz
                ;;
                *.[1-9].gz)
                    sudo cp ${manfile} /usr/share/man/man${section}
                ;;
                *)
                    echo ${manfile} is not a manual file
                    return 1
                ;;
            esac
        fi
    fi
}

sudo id >/dev/null

gem build rcal.gemspec

sudo gem install $GEM

rm $GEM

iman "man/rcal.1" && {
  echo manual installed
} || {
  echo manual not installed
}

rdoc --quiet
