# Guiding principles: calledtoconstruct/ghc-kcot-container

## Purpose and scope
A Docker image for working on the Haskell implementation of kata-checkout-order-total.

## Stack and layout
One `Dockerfile` based on `haskell:8.6.5`: installs zlib, clones calledtoconstruct/kata-checkout-order-total and runs `cabal install --only-dependencies` in its `haskell/` folder.

## Commands
| Check | Command | Evidence |
|---|---|---|
| Build | `docker build .` (the only build input is the Dockerfile; not written in the README) | Dockerfile |
| Lint | None configured | - |
| Tests | None | repository tree |
| CI | None | repository tree |

Commands marked as not written down come from the build files, not from project docs; confirm them before relying on them.

## Before every push
Before every push: run the build and type-check/lint that exist here, plus only the tests for the files or feature you changed (team rule, ideas #14 note 6797). Do not run the full suite locally as a routine gate; this repository has no CI that runs the full suite, so run the full suite only when the change is broad, and say in the PR that CI coverage is missing. Merge needs a positive review. Explain any new failure your change caused. Never weaken a valid test to make it pass, and never invent a command this file does not list.

## Project rules
- Keep the image focused on the kata's dependencies; do not add unrelated tools.
- Changing the base image tag changes the GHC version for the kata; say so in the PR.

## What to avoid
- Committing to the default branch; work on a branch and open a pull request.
- Deleting files, branches or history, or changing repository settings.
- Adding tooling, CI or dependencies that the change does not need.
- Rules copied from other projects (file-size limits, clocks, quotas) that this repository never adopted.

## Delivery and safety
- The image is not published from this repository.

## Open questions
- The base image is old (GHC 8.6.5); whether it still builds was not checked.

## Sources
Read from the `master` branch on 2026-11-08 ET: `README.md`, Dockerfile.

## Instruction updates
Check `guiding-principles.version` at the start of each turn and when you enter this project; reload this file when the version changes. Change this file, its version and date, and `PRINCIPLES_HISTORY.md` in the same commit. Team-wide role instructions are versioned separately in the team-process repository.
