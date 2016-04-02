ifeq ($(shell uname -s),Darwin)
BROWSER = open
else
BROWSER = chromium-browser 
endif

PORT = 8181

run: serve open

serve:
	@python -m SimpleHTTPServer $(PORT) & echo $$! > .server.pid
	@echo Serving at http://localhost:$(PORT)/

open:
	$(BROWSER) http://localhost:$(PORT)/

stop: .server.pid
	kill $(shell cat $<)
	@rm $<

.PHONY: open serve run
