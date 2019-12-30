# Pandoc Book Readme (Docker)

<!-- pandoc-book-readme -->
**Pandoc Book Readme** is a Docker container that auto-generates a compound README from Markdown files within the repository. It looks for all content between two comment tags, then inserts them in a README based on a template. (docker://merovex/pandoc-book-readme:latest)
<!-- /pandoc-book-readme -->

## Configuration

The following Github Action workflow should be added. Your repository name needs to be added

```
# Name: Maintain Version (Tagging)
#
# Description: This Github Action runs monthly to ensure there is a git tag associated
# with the version methodology (vYY.MM) where YY is the last two digits of the year
# and MM is the two-digit month.
# =================================================
on: [push]
name: Compile Readme (push)
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v1
      - name: Compile
        uses: docker://merovex/pandoc-book-readme:latest
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          REPO_NAME: <NAME OF YOUR REPOSITORY HERE>
```
