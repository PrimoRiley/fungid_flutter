

# generate-icons:
# 	flutter pub run flutter_launcher_icons:main

get-openapi-spec:
	wget https://api.fungid.app/openapi.json -O tmp/fungid-openapi.json

generate-code:
	flutter pub run build_runner build --delete-conflicting-outputs

generate: get-openapi-spec generate-code 

deploy-beta: deploy-android-draft deploy-ios-beta

clean:
	flutter clean

deploy-ios-beta:
	flutter clean \
	&& source .env \
	&& flutter build ipa \
	&& cd ios \
	&& fastlane ios beta

deploy-ios-release:
	flutter clean \
	&& source .env \
	&& flutter build ipa \
	&& cd ios \
	&& fastlane ios upload

deploy-android-draft:
	flutter clean \
	&& source .env \
	&& flutter build appbundle \
	&& cd android \
	&& fastlane android draft

deploy-android-release:
	flutter clean \
	&& source .env \
	&& flutter build appbundle \
	&& cd android \
	&& fastlane android deploy

deploy: deploy-android-release deploy-ios-release

generate-imagedb-file:
	sqlite3 ../fungid-api/dbs/gbif.sqlite3 < app_db/create-image-table.sql \
	&& sqlite3 ../fungid-api/dbs/gbif.sqlite3 ".dump classifier_species_images" > assets/db/images.sql \
	&& sqlite3 ../fungid-api/dbs/gbif.sqlite3 "DROP TABLE classifier_species_images;"
	
detect-leaks:
	gitleaks detect -v
	
check-size:
	flutter clean \
	&& flutter build appbundle --analyze-size --target-platform android-arm64

direct-install:
	&& flutter build appbundle \
	&& bundletool build-apks --bundle=build/app/outputs/bundle/release/app-release.aab --output=build/app/outputs/bundle/release/app-release.apks \
	&& bundletool install-apks --apks=build/app/outputs/bundle/release/app-release.apks

setup-assets: 
	cp assets_staging/wikipedia.tar.bz2 assets/ \
		&& bzip2 -9 assets_staging/app.sqlite3 -c > assets/app.sqlite3.bz2 \
		&& cp assets_staging/models/labels.csv assets/models