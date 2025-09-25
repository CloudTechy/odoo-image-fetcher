# Usage:
# make test        → run tests
# make build       → build wheel & sdist
# make clean       → remove build artifacts
# make publish     → upload to PyPI
# make tag v=0.1.2 → tag and push
# make release v=0.1.2 → full release

PACKAGE_NAME = odoo_image_fetcher

test:
	pytest

build:
	python setup.py sdist bdist_wheel

clean:
	rm -rf dist build *.egg-info

publish:
	twine upload dist/*

tag:
	git tag $(v)
	git push origin $(v)

release: clean test build publish tag
