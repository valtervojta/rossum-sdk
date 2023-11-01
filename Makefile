SHELL = /bin/bash

VENV_PATH = .venv

help:
	@echo "Thanks for your interest in the Rossum Python SDK!"
	@echo
	@echo "make install: Install all needed dependencies including tests"
	@echo "make lint: Run linters"
	@echo "make test: Run basic tests (not testing most integrations)"
	@echo "make test-all: Run ALL tests (slow, closest to CI)"
	@echo "make format: Run code formatters (destructive)"
	@echo
	@echo "Also make sure to read ./CONTRIBUTING.md"
	@false

.venv:
	virtualenv -ppython3 $(VENV_PATH)
	$(VENV_PATH)/bin/pip install tox

install:
	$(VENV_PATH)/bin/pip install -e '.[tests]'

format: .venv
	$(VENV_PATH)/bin/tox -e linting --notest
	.tox/linting/bin/black .
.PHONY: format

test: .venv
	pytest tests
.PHONY: test

lint: .venv
	@set -e && $(VENV_PATH)/bin/tox -e linting || ( \
		echo "================================"; \
		echo "Bad formatting? Run: make format"; \
		echo "================================"; \
		false)
.PHONY: lint

