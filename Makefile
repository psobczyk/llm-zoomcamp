
.PHONY: base-venv
base-venv:
	python3.10 -m venv .venv
	. .venv/bin/activate;
	pip install --upgrade pip
	pip install pip-tools

requirements.txt: requirements.in
	pip-compile --generate-hashes requirements.in

.PHONY: install
install: requirements.txt
	. .venv/bin/activate; pip install -r requirements.txt

.PHONY: clean-venv
clean-venv:
	rm -rf .venv