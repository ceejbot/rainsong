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
