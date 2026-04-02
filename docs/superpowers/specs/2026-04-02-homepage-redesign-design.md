# Homepage Redesign Design

## Goal

Redesign the personal homepage into a light, academic researcher-style site that feels calm, modern, and credible while preserving the existing core content: bio, research focus, representative publications, recent updates, and contact information.

## Current State

The current homepage is functional but visually dated and structurally overloaded:

- The homepage mixes navigation, profile, news, the full publication archive, and contact details into one long page.
- The visual language is old Jekyll-Bootstrap styling with limited hierarchy, dense tables, and minimal spacing.
- The page includes legacy elements that weaken the academic tone, such as the visitor counter and “last update” line.
- The full publication list currently lives on the homepage, while `pages/pubs.md` is incomplete.
- Navigation points to outdated supporting pages, which would make a homepage-only redesign feel inconsistent.

## Design Direction

Use a **research overview homepage** rather than a dense archive homepage.

This direction keeps the homepage concise and professional:

- lead with identity and current role
- summarize research areas clearly
- highlight selected papers instead of showing the entire archive
- keep recent updates visible but compact
- move the full publication list to the dedicated publications page

This is the best fit for a scholar/research scientist homepage because it improves readability without hiding the depth of the work.

## Non-Goals

The redesign should not introduce unrelated complexity:

- no CMS, database, or publication automation
- no JavaScript-heavy interactions
- no dependency or framework migration beyond the existing Jekyll/GitHub Pages setup
- no rewrite of unrelated legacy pages unless directly needed for navigation consistency

## Information Architecture

### 1. Global header

The site header should become simpler and more editorial:

- site title / name on the left
- compact navigation on the right
- navigation focused on useful destinations: `Home`, `Publications`, `CV`

External links such as GitHub and Google Scholar should be presented as profile actions in the hero area rather than crowding the top navigation.

### 2. Hero section

The homepage should open with a strong academic identity block:

- name
- current title and affiliation
- 2-3 sentence professional summary
- research interests presented as concise tags or inline descriptors
- profile photo
- quick links for CV, GitHub, Google Scholar, and email

The hero should establish credibility immediately and provide the main calls to action without visual noise.

### 3. Research overview section

Below the hero, add a structured overview of research themes.

Recommended presentation:

- 3 concise theme cards or columns
- each card contains a theme name plus a short explanation

Initial themes should follow the current content:

- Autonomous Driving
- Embodied AI / Robotics
- Cross-Modal Understanding and Generation

This section replaces the current inline sentence with a more scannable structure.

### 4. Selected publications section

The homepage should show a curated set of representative papers instead of the full archive.

Recommended content:

- exactly 4 featured papers on the homepage
- emphasize recent or representative work
- each item includes title, venue/year, a one-line summary, and PDF/code links where available
- use an existing thumbnail when the paper already has one in `pages/pub_pics/`
- if a chosen paper does not have an existing thumbnail, render it as a text-only featured item rather than introducing a placeholder graphic
- include a clear link to the full publications page

The selected list should favor research identity over completeness. A likely mix is:

- recent 2024 work
- a flagship paper such as UniAD
- a small number of earlier influential papers

The one-line summaries should be concise editorial summaries derived from the paper title/topic and do not require additional source material beyond the existing publication metadata.

### 5. Recent updates section

Convert the current long “What’s New” list into a compact recent updates section.

- keep the 5 most recent items on the homepage
- retain reverse chronological order
- avoid overly long dense lists

This keeps freshness without overwhelming the page.

### 6. Contact section

End the homepage with a clean contact block:

- name
- email
- city / country
- optional affiliation mention

This section should be visually quiet and easy to find.

The contact block must use the anchor/id `contact` so internal links can reliably target it.

## Visual System

The homepage should use a light, understated academic visual language.

### Color palette

- warm off-white or very light neutral background
- dark slate text for body copy
- muted blue accent for links and subtle highlights
- light borders/shadows used sparingly

The goal is calm contrast rather than bright branding.

### Typography

- refined serif or serif-like styling for major headings
- clean sans-serif for body text and metadata
- strong spacing hierarchy rather than large decorative typography

Use system-safe fonts only so the site remains simple and GitHub Pages friendly.

### Layout behavior

- desktop: balanced two-column hero, single-column content flow below
- mobile: collapse into one column with comfortable spacing
- generous whitespace between sections
- card-based grouping where it improves scanability

### Tone

The site should feel:

- scholarly
- modern but not trendy
- precise
- clean and calm

It should not feel like a startup landing page or a design portfolio.

## Content Strategy

### Homepage content to keep

- name and profile photo
- current position and affiliation
- short bio
- research interests
- recent news
- representative publications
- contact information
- CV / GitHub / Google Scholar links

### Homepage content to remove

- visitor counter
- “last update” text line
- full publication archive from the homepage
- redundant bootstrap-era nav block inside `index.md`

### Publication archive handling

The current publication archive on the homepage should be preserved by moving it to `pages/pubs.md`.

Preservation requirements:

- keep the existing reverse chronological grouping by year
- keep the existing numbering, titles, author text, venue/year text, and external links intact
- keep existing thumbnails wherever they are already referenced
- allow formatting cleanup for readability, but do not drop publication entries
- the homepage should link to `/pages/pubs.html`, not to per-paper anchors

`pages/pubs.md` becomes the canonical full publication archive linked from the homepage and top navigation.

### Supporting pages

The redesign should avoid emphasizing stale legacy pages in navigation. If a page is outdated and not refreshed as part of this task, it should not be a primary navigation target.

## Implementation Boundaries

The design should be implemented with focused, minimal-surface changes:

- rewrite `index.md` with the new homepage structure
- update `pages/pubs.md` so it contains the full publication archive
- update the shared default theme layout to support cleaner navigation and page structure
- add or extend custom CSS for the new visual system
- update any internal links that should now point to the homepage contact block or publications page

The redesign should stay within the current Jekyll/GitHub Pages setup and avoid introducing new runtime dependencies.

Changes to the shared default layout must stay boundary-safe:

- apply the refreshed global header site-wide
- scope homepage-specific visual treatment to the homepage markup/classes only
- avoid rewriting the internal content structure of non-homepage pages unless directly required for link consistency
- explicitly re-check at least the homepage, publications page, and 404 page after layout changes

## File-Level Design

### `index.md`

Will become a curated homepage with:

- hero
- research overview
- selected publications
- recent updates
- contact

The homepage root content should carry explicit hooks/classes so styling can be scoped without accidentally restyling legacy subpages.

### `pages/pubs.md`

Will become the full publications archive so the homepage can stay concise.

### `_includes/themes/twitter/default.html`

Will be updated to provide:

- cleaner global navigation
- better page shell for a modern academic layout
- optional hooks/classes needed by the new CSS

This layout change is limited to shared chrome and wrapper structure. It should not require content rewrites for legacy secondary pages.

### `assets/themes/twitter/css/style.css` and/or a new dedicated stylesheet

Will contain the new visual system:

- background and typography
- section spacing
- hero layout
- cards / publication entries
- responsive behavior

The preferred implementation is to add a focused homepage stylesheet and keep legacy CSS changes targeted, rather than scattering many overrides into unrelated files.

## Accessibility and Robustness

The redesign should preserve static-site robustness:

- no dependence on client-side JavaScript for core content
- meaningful heading structure
- sufficient contrast
- descriptive alt text for profile and publication thumbnails where shown
- links remain readable and obvious

## Verification

The implementation should be verified by:

- building the site with `bundle exec jekyll build`
- checking that the homepage renders with the new sections
- confirming the publications page still contains the complete archive
- confirming navigation links are valid
- confirming `/#contact` resolves correctly from internal links
- confirming the layout remains readable on narrow screens

## Chosen Recommendation

Proceed with a **light academic overview homepage**:

- concise homepage
- curated representative work
- separate full publications page
- minimal, elegant typography and spacing
- no decorative or noisy legacy widgets
