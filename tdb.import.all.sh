#!/bin/bash

rm /usr/lib/fuseki/db/interlinks/*
rm all.nt

for i in *.nt ; do cat "${i}" >> all.nt; done;
rapper -g all.nt | sort -u > a.nt && mv a.nt all.nt
#java -Xmx8000M tdb.tdbloader --desc=/usr/lib/fuseki/tdb.interlinks.ttl --graph=http://270a.info/graph/meta all.nt
