PYTHON ?= python

.PHONY: test plans check
test:
	$(PYTHON) -m unittest discover -s tests -v
plans:
	@for project in projects/*; do $(PYTHON) "$$project/pipeline.py" --config "$$project/config.example.json" > /dev/null || exit 1; done
check: test plans
	$(PYTHON) -m compileall -q common projects tools tests
