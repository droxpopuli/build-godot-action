build-godot-action
==================

![Release Version](https://img.shields.io/github/v/release/josephbmanley/build-godot-action) ![Test Action](https://github.com/josephbmanley/build-godot-action/workflows/Test%20Action/badge.svg)

### Feature Branch: gut-support (testing and deployment)

Features/Fixes:

- [x] Testing Support via GUT (Godot Unit Test) addon
- [x] Dockerfile for containerized local testing
- [x] Example Workflow
- [x] Reduced redundant export template downloads
- [ ] GH Releases deployment
- [ ] itch.io deployment 

The following badge is a possible workflow for using this tool. (Note: As the Gut testing uses the master from Gut's repository, the test jobs may not all pass so the failing build status is normal.)

![Example Usage](https://github.com/droxpopuli/build-godot-action/workflows/Example%20Usage/badge.svg?branch=gut-support)

# Build Godot Project

This action builds the godot project in your `$GITHUB_WORKSPACE`, so that you can easily automate builds.

## Usage

This action will create a `build` folder an outputed build. You must have the export preset configured for the target platform to successfully export.

Example:

```yaml
steps:
- uses: josephbmanley/build-godot-action@[VERSION]
  with:
    name: godot-project
    preset: HTML5
```

### Inputs

#### name **required**

    The name of the exported package/binary

#### preset **required**

    The name of the preset found in `export_presets.cfg` you would like to build.

#### subdirectory

    *Optional*

    The subdirectory in the `build` folder to output build to, can be useful for self packaging.

#### package

    *Optional*

    Boolean value, when set to true, builds artficat zip file.

#### debugMode

    *Optional*

    Boolean value, when set to true, runs export in debug mode.

### Outputs

#### build

    The location the outputed build is placed.

#### artifact

    The location the outputed artifact is placed.


## Credits

This action uses the [godot-ci](https://github.com/aBARICHELLO/godot-ci) docker image from [BARICHELLO](https://github.com/aBARICHELLO)
