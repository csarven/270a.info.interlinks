#!/bin/bash

rm /usr/lib/fuseki/DB.interlinks/*
rm all.nt

for i in *.nt ; do rapper -g "$i" >> all.nt ; done
sort -u all.nt > foo.nt && mv foo.nt all.nt
java -Xmx4000M tdb.tdbloader --desc=/usr/lib/fuseki/tdb.interlinks.ttl --graph=http://270a.info/graph/meta all.nt
