NAMESPACE = $(shell yq -r .namespace galaxy.yml)
ROLENAME = $(shell yq -r .name galaxy.yml)
ROLEVERSION = $(shell yq -r .version galaxy.yml)
DIST = ./dist
GALAXY = @ansible-galaxy

.PHONY: build
build:
	$(GALAXY) collection build --output-path "$(DIST)"

.PHONY: publish
publish:
ifeq (, $(shell which yq))
	$(error "no yq. try doing pip3 install yq")
else
	$(GALAXY) collection publish "$(DIST)/$(NAMESPACE)-$(ROLENAME)-$(ROLEVERSION).tar.gz" --api-key="${ANSIBLE_TOKEN}"
endif

.PHONY: install
install:
ifeq (, $(shell which yq))
	$(error "no yq. try doing pip3 install yq")
else
	$(GALAXY) collection install "$(DIST)/$(NAMESPACE)-$(ROLENAME)-$(ROLEVERSION).tar.gz"
endif

.PHONY: test
test:
	$(MAKE) -C roles/firmware_amd test
	$(MAKE) -C roles/ssacli test

.PHONY: version
version:
ifeq (, $(shell which yq))
	$(error "no yq. try doing pip3 install yq")
else
	@echo "$(ROLEVERSION)"
endif

.PHONY: clean
clean:
	-rm --recursive "$(DIST)"
