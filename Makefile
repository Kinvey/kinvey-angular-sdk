PROJECT = "Kinvey Angular SDK"

clean: ;@echo "Cleaning ${PROJECT}..."; \
	rm -rf node_modules

install: ;@echo "Installing dependencies for ${PROJECT}..."; \
	npm install

test: ;@echo "Testing ${PROJECT}..."; \
	npm run test:jenkins

upload: ;@echo "Uploading ${PROJECT} to S3..."; \
	./node_modules/.bin/gulp upload

publish: ;@echo "Publishing ${PROJECT}..."; \
	npm install -g ci-npm-publish
	npm publish --npmuser ${NPMUSER} --npmemail ${NPMEMAIL} --npmpassword ${NPMPASSWORD}
	npm uninstall -g ci-npm-publish

audit: clean install test
release: audit upload publish

.PHONY: clean install test upload publish audit release
