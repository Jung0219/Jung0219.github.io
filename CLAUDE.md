# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a personal academic portfolio website based on the Academic Pages template (forked from Minimal Mistakes). The site is hosted on GitHub Pages at jung0219.github.io and showcases publications, projects, and CV information for Gihwan (Finn) Jung.

## Local Development

### Running the Site Locally (Docker - Preferred Method)

**ALWAYS use Docker to build and preview the site locally.**

1. **Open terminal** in the project directory

2. **Start the server:**
   ```bash
   docker compose up --build
   ```

3. **Wait for the build** to complete (~20-30 seconds first time). Look for:
   ```
   Server address: http://0.0.0.0:4000/
   Server running... press ctrl-c to stop.
   ```

4. **View the site:** Open browser to `http://localhost:4000`

5. **Stop the server:** Press `Ctrl+C`

**Notes:**
- Subsequent runs: use `docker compose up` (no `--build` needed)
- Site auto-regenerates when files are edited (may not work on some Windows versions)
- Keep terminal open while viewing the site

### JavaScript Build
```bash
# Build minified JavaScript assets
npm run build:js

# Watch for JS changes and rebuild
npm run watch:js
```

### Content Generation
```bash
# Generate markdown files from TSV data
# Use Jupyter notebooks or Python scripts in markdown_generator/
# For publications and talks from structured TSV files
```

## Content and Structure
- `_publications/` - Research papers and publications
- `_projects/` - Personal/academic projects
- `_pages/` - Static pages (about, cv, etc.)
- `_posts/` - Blog posts (if used)
- `_config.yml` - Site settings, author profile, social links, collections configuration
- `_data/navigation.yml` - Header navigation menu structure
- `_data/cv.json` - Structured CV data
- `_layouts/` / `_includes/` / `_sass/` - Templates, partials, and styling
- `assets/` - Static assets (JS, images, etc.)
- `files/` - Static files (PDFs, etc.) accessible at /files/example.pdf

## Content Management
Each content item (publication, project, etc.) is a markdown file with YAML frontmatter. The frontmatter contains structured metadata used to:
- Generate collection pages (e.g., /publications/)
- Create individual item pages
- Populate CV sections
- Generate dynamic content like talk maps (using talkmap.py/ipynb)

## Static Files
Upload PDFs, ZIPs, or other files to `files/` directory. They will be accessible at `https://jung0219.github.io/files/filename.pdf`

## Deployment
Site automatically builds and deploys via GitHub Pages when changes are pushed to the repository. No manual build/deploy steps needed for production.
