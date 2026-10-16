PYTHON := venv/bin/python 
SRC := src
BUILD := build 

.PHONY: all build run clean  

# Default target 
all: build run

# Compile python files to build/
build:
	@mkdir -p $(BUILD)
	@$(PYTHON) -m compileall -q -b $(SRC)
	find $(SRC) -name "*.pyc" -exec cp {} $(BUILD) \;

# running main.py (the make default)
run:
	$(PYTHON) $(SRC)/main.py 

# remove previous compiled artifacts 
clean:
	rm -rf $(BUILD)
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -name "*.pyc" -delete
