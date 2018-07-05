Files generated with `node2nix` from bootstrap repository checkout (https://github.com/twbs/bootstrap):

- default.nix
- node-env.nix
- node-packages.nix

My own patches:

- style.patch

My own override:

- override.nix

From running `nix-build override.nix` i expect to happen the following:

- download bootstrap (with correct commit)
- apply patches
- install dependencies for the next step
- run `npm run css-compile` --> results in `result/lib/node_modules/bootstrap/dist/css/bootstrap.css` and reflects my patches
