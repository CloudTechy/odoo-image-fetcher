#!/bin/bash

set -e

VERSION=$1

if [ -z "$VERSION" ]; then
  echo "Usage: ./publish.sh <version>"
  exit 1
fi

echo "📦 Cleaning..."
rm -rf dist build *.egg-info

echo "✅ Running tests..."
pytest

echo "🛠️ Building package..."
python -m build

echo "🚀 Publishing to PyPI..."
twine upload dist/*

echo "🏷️ Tagging version $VERSION"
git tag $VERSION
git push origin $VERSION

echo "cleaning up"
rm -rf dist build *.egg-info

echo "✅ Done!"