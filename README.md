# RAMP Monorepo Test 2

The following RAMP repost are merged as packages in this monorepo:

-   https://github.com/fgpv-vpgf/fgpv-vpgf.git ramp packages/ramp
-   https://github.com/fgpv-vpgf/geoApi.git geoapi packages/geoapi
-   https://github.com/fgpv-vpgf/plugins.git plugins packages/plugins
-   https://github.com/RAMP-PCAR/geosearch.git geosearch packages/geosearch

Right now, only `geoapi` is hotlinked into the ramp package (`geosearch` and `plugins` are just sitting there doing nothing; `ramp` package will fetch them from NPM as usual). Other will come later as this is just another POC.

## Getting Started

From your shell, install Rush like this (if don't already have it):

```
$ npm install -g @microsoft/rush
```

Clone the repo and use Rush to install dependencies:

```
$ rush update
```

Serve the project:

```
$ rush serve
```

Open the page (you can click on emoji):

```
http://localhost:6001/samples/index-samples.html
```

In your editor, make changes to `packages\geoapi\src\index.js` file and observe the page reloaded on save.

# Remaining Problems

## 1. Git Specifiers

Rush doesn't like github url specifiers (https://github.com/Microsoft/web-build-tools/issues/1116). Things like these:

-   https://github.com/fgpv-vpgf/shapefile-js.git#v3.6.0
-   github:fgpv-vpgf/svg.textflow.js

Ideally, all packages would need to either come from NPM, or be included in the monorepo, not just being grabbed from github.

## 2. Implicit Dependencies

It turned out RAMP core relies on implicit dependencies which are installed by the plugins repo and other something else(?). I had to manually add the following to get it to build:

-   "ag-grid-community": "19.0.0"
-   "jquery": "3.4.1"
-   "babel-runtime": "6.26.0"

We need to ferret out these implicit dependencies and make them explicit in the core.

## 3. Unknown unknowns

❔❔❔

# Further Tasks

-   use geosearch as a monorepo dependency
-   use plugins as a monorepo dependency
-   clean up and make it stable
-   re-enable `build` and `serve` commands
-   eat 🍰
