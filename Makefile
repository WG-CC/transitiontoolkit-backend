# Virtual environment name
PY=python3
VENV=venv
SOURCE= source $(VENV)/bin/activate

# Make it work on windows
ifeq ($(OS), Windows_NT)
	SOURCE= source $(VENV)/Scripts/activate
	PY=py
endif

.PHONY: venv install runserver clean freeze lint
# Create virtual environment
venv:
	 $(PY) -m venv $(VENV)

# Install dependencies from requirements.txt
install: venv requirements.txt
	@echo "Installing dependencies ✨"
	$(PY) -m pip install --upgrade pip
	$(SOURCE) && pip install -r requirements.txt

# Run the FastAPI server
runserver:
	@echo "Starting server 🚀"
	$(SOURCE) && uvicorn app:app --reload

# Clean up virtual environment
clean:
	rm -rf $(VENV)

# Generate requirements.txt from installed packages
freeze:
	$(SOURCE) && pip freeze > requirements.txt

lint:
	@echo "Linting ✨"
	flake8
# Define default target
.DEFAULT_GOAL := help

# Display help message
help:
	@echo "Please use 'make <target>' where <target> is one of:"
	@echo "  venv        to create a virtual environment"
	@echo "  install     to install dependencies"
	@echo "  runserver   to run the FastAPI server"
	@echo "  clean       to clean up the virtual environment"
	@echo "  freeze 	 to add any new dependencies to the requirements.txt"
