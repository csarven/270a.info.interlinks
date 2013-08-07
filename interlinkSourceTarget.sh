#!/bin/bash

tdbAssembler="/usr/lib/fuseki/tdb.interlinks.ttl";
JVM_ARGS="-Xmx4000M";

agencySource="ecb";
agencyTargets=(bfs);

for agencyTarget in "${agencyTargets[@]}" ; do
    rm -rf /usr/lib/fuseki/DB.interlinks

    java "$JVM_ARGS" tdb.tdbloader --desc="$tdbAssembler" --graph=http://"$agencySource".270a.info/graph/meta /data/"$agencySource"-linked-data/data/"$agencySource".exactMatch."$agencyTarget".nt

    java -Xmx4000M tdb.tdbquery --desc="$tdbAssembler" --results=n-triples 'CONSTRUCT { ?o <http://www.w3.org/2004/02/skos/core#exactMatch> ?s } WHERE { ?s <http://www.w3.org/2004/02/skos/core#exactMatch> ?o }' | sort -u > /data/"$agencyTarget"-linked-data/data/"$agencyTarget".exactMatch."$agencySource".nt
done ;
