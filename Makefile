SHELL := /bin/bash
SCRIPT := installer.sh

.PHONY: core home security htb headless clean

core:
	@sudo -E $(SHELL) -c "./$(SCRIPT) 1"

home:
	@sudo -E $(SHELL) -c "./$(SCRIPT) 2"

security:
	@sudo -E $(SHELL) -c "./$(SCRIPT) 3"

htb:
	@sudo -E $(SHELL) -c "./$(SCRIPT) 4"

headless:
	@sudo -E $(SHELL) -c "./$(SCRIPT) 5"
