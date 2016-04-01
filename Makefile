ifeq ($(shell uname -s),Darwin)
BROWSER = open
else
BROWSER = chromium-browser 
endif

PORT = 8181

run: serve open

serve:
	python -m SimpleHTTPServer $(PORT) &


open:
	$(BROWSER) http://localhost:$(PORT)/

.PHONY: open serve run
