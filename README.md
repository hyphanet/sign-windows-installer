# Signing the Windows installer

This repository contains the instrumentation (submodules, scripts, CI
setup) to verify that the freenet.jar used in the windows innosetup
installer build is created from the actual fred sources without
functional changes.

The functionality is in .github/... and scripts/verify-build

To run a release, update the submodules to the release tag and let the
CI check the build.

Free code signing is provided by
[SignPath.io](https://about.signpath.io/?), the certificate by the
[SignPath Foundation](https://signpath.org/).


## Submodules

- fred: the Hyphanet fred sources https://github.com/hyphanet/fred
- scripts: the release scripts with verify-build https://github.com/hyphanet/scripts
- wininstaller-innosetup: the windows installer https://github.com/hyphanet/wininstaller-innosetup

## Verification Process

On debian-oldstable with Java 8:

- get freenet.jar from the fred releases
- copy freenet.jar to /tmp/freenet-{TAG_VERSION}.jar0
- setup ~/.freenetrc from .freenetrc
- copy freenet.jar to $releaseDir
- run verify-build

On windows:

- build the windows installer with the checked freenet.jar
- sign the windows installer
- upload the windows installer

## License

GPLv2 or later.
