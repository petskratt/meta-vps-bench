# Meta VPS Bench, slightly forked

Rudimentary scripts to run benchmarks comparing Cloud VPS providers.

Runs sysbench and speedtest

Example: https://b3n.org/digitalocean-vultr-lightsail-benchmarks/

Usage:
```bash
    git clone https://github.com/petskratt/meta-vps-bench.git
    cd meta-vps-bench
    ./setup.sh
    ./bench.sh
    ./parse.sh
    cat speed*.result
```

This fork has some minor fixes:

+ chmod +x for .sh scripts
+ memory results parsing
+ removed speedtest targets that are not active anymore
+ made running speedtests optional (`./bench.sh speedtest`)
+ parsing with tabs, not commas (for small-scale use and copying to Excel :-)
+ each run overwrites results (>, not >>)
+ secure db password