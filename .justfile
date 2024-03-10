@_help:
	just --list

# Serialize the plugins to yaml.
serialize:
	~/bin/spriggit serialize -d --InputPath data/rainsong.esp --OutputPath ./plugins/rainsong_esp/ --GameRelease SkyrimSE --PackageName Spriggit.Yaml
	~/bin/spriggit serialize --InputPath data/rainsong_azurite2.esp --OutputPath ./plugins/rainsong_azurite2_esp/ --GameRelease SkyrimSE --PackageName Spriggit.Yaml
	~/bin/spriggit serialize --InputPath data/rainsong_raid.esp --OutputPath ./plugins/rainsong_raid_esp/ --GameRelease SkyrimSE --PackageName Spriggit.Yaml
	~/bin/spriggit serialize --InputPath data/rainsong_azurite_expansion.esp --OutputPath ./plugins/rainsong_azurite_expansion/ --GameRelease SkyrimSE --PackageName Spriggit.Yaml

# Re-hydrate a specific plugin from yaml.
hydrate P="rainsong":
	~/bin/spriggit deserialize --InputPath ./{{P}} --OutputPath ./data/{{P}}.esp

# make 7z archive
archive:
	cd data && 7zz -x!'.DS_Store' a rainsong.7z *
	mv data/rainsong.7z .

# Install to development mod directory
install:
	rsync -a -v data/ /Volumes/MO2Skyrim/rainsong-dev

# copy plugins back
backup:
	cp /Volumes/MO2Skyrim/rainsong-dev/*.esp data

# Set the version in the FOMOD and tag the repo to match. Requires bash.
[unix]
tag VERSION:
	#!/usr/bin/env bash
	sed="sed"
	ignored=$(which gsed)
	if [ $? == 0 ]; then
		sed="gsed"
	fi
	set -e
	# update the fomod version
	iconv -f UTF-16LE -t UTF-8 data/fomod/info.xml >data/fomod/info_utf8.xml
	$sed -i -e 's/<Version>[0-9][0-9]*\.[0-9]*\.[0-9]*<\/Version>/<Version>{{VERSION}}<\/Version>/' data/fomod/info_utf8.xml
	iconv -f UTF-8 -t UTF-16LE data/fomod/info_utf8.xml >data/fomod/info.xml
	rm data/fomod/info_utf8.xml
	git commit data/fomod/info.xml -m "v{{VERSION}}"
	git tag "v{{VERSION}}"
	echo "Release tagged for version v{{VERSION}}"
