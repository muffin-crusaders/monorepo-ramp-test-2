# RAMP Monorepo Test 2

The following RAMP repos are merged as packages in this monorepo:

-   https://github.com/fgpv-vpgf/fgpv-vpgf.git ramp packages/ramp
-   https://github.com/fgpv-vpgf/geoApi.git geoapi packages/geoapi
-   https://github.com/fgpv-vpgf/plugins.git plugins packages/plugins
-   https://github.com/RAMP-PCAR/geosearch.git geosearch packages/geosearch

All plugins are pulled into separate packages (prefixed with `ramp-plugin`) with their own build processes. `geoapi`, `geosearch` and all the plugin packages are locally linked into the `ramp-core` though rush (see `rush.json` file). The current folder structure is as follows:

-   packages\
    -   ramp-core\
    -   ramp-geoapi\
    -   ramp-geosearch\
    -   ramp-plugin-areas-of-interest\
    -   ramp-plugin-back-to-cart\
    -   ramp-plugin-cake-export\
    -   ramp-plugin-coordinate-info\
    -   ramp-plugin-eh-table\

## Getting Started

### Creating monorepo
To create a new RAMP monorepo, perform the following steps.

Create a file `repos.txt` with the following lines:
```
https://github.com/fgpv-vpgf/fgpv-vpgf.git ramp packages/ramp
https://github.com/fgpv-vpgf/geoApi.git geoapi packages/geoapi
https://github.com/fgpv-vpgf/plugins.git plugins packages/plugins
https://github.com/RAMP-PCAR/geosearch.git geosearch packages/geosearch
```

Clone tomono repo:
```git
git clone https://github.com/unravelin/tomono.git
```

Pipe the `repos.txt` file throug the script.
```
$ cat repos.txt | ~/tomono/tomono.sh
```
 This will create a `core` folder with all the repos merged as follows:
 -   core\
    -   packages\
        -   ramp\
        -   geoapi\
        -   plugins\
        -   geosearch\

You can split or raname folder under the `packages` folder as you wish (see above how the structure I use).

### Running monorepo

From your shell, install Rush like this (if don't already have it):

```
$ npm install -g @microsoft/rush
```

Clone the repo and use Rush to install dependencies:

```
$ rush update
```

You might want to run `rush update -p --full` to cleanly re-install all the dependencies:

-   `-p` for purge, to remove all the installed packages
-   `--full` just because it looks important

Serve the project:

```
$ rush serve -p 10 -v
```

-   `-p 10` specifies the maximum number of concurrent processes to run (we need 8 right now to serve all the packages at the same time)
-   `-v` provides verbose output for debugging

Rush can't run a command just for a subset of packages, but this feature is being considered (https://github.com/microsoft/web-build-tools/issues/1168, https://github.com/microsoft/web-build-tools/issues/1202).

So, if you want to work only on several packages (say `ramp-core` and `ramp-eh-table`), you need to run `npm run serve` as separate processes:

```
// terminal 0
$ cd packgages/ramp-core
$ npm run serve

// terminal 2
$ cd packgages/ramp-plugin-eh-table
$ npm run serve
```

Open a samples page:

```
http://localhost:6001/samples/index-samples.html
http://localhost:6001/samples/plugins/cake-export/cake-export-index.html
```

In your editor, make changes to any of the packages' source files and observe the page hot-reload on save.

See other rush commands here: https://rushjs.io/pages/commands/rush_add/

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

-   ~~implement Travis builds~~
-   ~~implement Azure cloud built deployment~~
-   implement docs publishing
-   ???
-   ~~use geosearch as a monorepo dependency~~
-   ~~use plugins as a monorepo dependency~~
-   ~~clean up and~~ make it stable
-   ~~re-enable `build` and `serve` commands~~
-   [maybe] re-enable test harness for `eh-table`
-   figure out why we need four different versions of Typescript to build this
-   eat 🍰
