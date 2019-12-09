# docker-quake

Test out of running quake engine in docker

## Building

```bash
./docker/make_container.sh
./docker/run.sh
git clone git://disenchant.net/git/tyrquake
cd tyrquake
make DEBUG=y
cp bin/* ../quake
cd ../quake
./get_bins.sh
```

## Running quake

First you need to download a shareware version (google quake106.zip)

unzip the download and unzip the lha archive within:

```bash
unzip quake106.zip
lha e resource.1
```

copy/rename pak file to id1 folder under quake:

```bash
mkdir quake/id1
cp ID1/PAK0.PAK quake/id1/pak0.pak
```

Enjoy:
```bash
cd quake
./tyr-glquake
```

