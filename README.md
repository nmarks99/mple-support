# mple-support

CMake superbuild for the non-EPICS dependencies used by `mple`. Each dependency is configured, built, and installed independently with `ExternalProject_Add()`.

## Build

```sh
EPICS_HOST_ARCH=rhel9-x86_64 ./scripts/build.sh
```

The build installs Eigen, nlohmann/json, OMPL, toppra, Pinocchio, and Pinocchio's URDF dependencies under:

```text
install/$EPICS_HOST_ARCH
```

Dependencies are static and position-independent by default. Use
`-DMPLE_SUPPORT_BUILD_SHARED_LIBS=ON` to build shared libraries.

## Use from mple

Set the installed prefix in `mple/configure/CONFIG_SITE.local`:

```make
MPLE_SUPPORT = /path/to/mple-support/install/$(EPICS_HOST_ARCH)
```

The installation provides:

```text
share/mple-support/mple-support.mk
share/mple-support/manifest.txt
```

`mple` should consume those installed files rather than this repository's source or build directories.
