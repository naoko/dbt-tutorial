REQUIREMENTS_IN_FILES ?= $(shell find . -name '*.in' -name '*requirements*')
REQUIREMENTS_TXT_FILES ?= $(REQUIREMENTS_IN_FILES:.in=.txt)
PYTHON_VERSION=3.9.13
VENV_NAME=dbt

init:
	pyenv install $(PYTHON_VERSION) -s
	@echo -e "✅️  🐍 $(PYTHON_VERSION) installed"
	@if ! [ -d "$$(pyenv root)/versions/$(VENV_NAME)" ]; then\
		pyenv virtualenv $(PYTHON_VERSION) $(VENV_NAME);\
		pyenv local $(VENV_NAME);\
		pip install --upgrade pip pip-tools setuptools wheel;\
	fi;
	@pyenv local $(VENV_NAME)
	@echo -e "✅️  🐍 $(VENV_NAME) virtualenv activated"
	pip install -r requirements.txt

clean:
	rm -rf __pycache__
