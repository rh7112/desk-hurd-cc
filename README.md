# desk-hurd-cc

The interactive, illustrated desk version of [ryan.hurd.cc](https://ryan.hurd.cc), served at **https://desk.hurd.cc**.

It is one static page built from the parts in `desk/`:

| Part | Contents |
| --- | --- |
| `01-head.html` | `<head>`, fonts, meta |
| `02-style.css` | all styles |
| `03-header.html` | page header / opening markup |
| `04-scene.svg.html` | the desk scene (SVG) |
| `05-overlay.html` | apps: VS Code look-alike, projects dashboard, phone, hotspots |
| `06-script.js.html` | camera, apps, routing |
| `07-tail.html` | closing markup |

## Build

```sh
sh build.sh   # writes public/index.html (gitignored)
```

Open `public/index.html` directly, or serve `public/` locally (for example `npx serve public`). On `localhost` and `*.hurd.cc` the page uses clean paths; elsewhere it falls back to `#hash` links.

## Deep links

`desk.hurd.cc/<place>` opens that spot on the desk. A `#hash` also works.

`/code`, `/phone`, `/projects`, `/desktop`, `/degrees`, `/books`, `/bookshelf`, `/left`, `/center`, `/right`, `/desk`, `/table`, `/under`, `/overview` (`/contact` opens the phone).

## Deploy

Pushes to `main` build and deploy to a Cloudflare Worker with static assets (see `wrangler.jsonc`) via `.github/workflows/deploy.yml`. It needs the `CLOUDFLARE_API_TOKEN` repository secret. The `desk.hurd.cc` custom domain is created by the first deploy. Unknown paths fall back to `index.html` so deep links work.

Requirements for the integrated site (tracked in [ryans-portfolio#109](https://github.com/rh7112/ryans-portfolio/issues/109)): keep Lighthouse and accessibility scores, and respect `prefers-reduced-motion`.
