# Iaito Translations

This repository holds translations for the [Iaito](https://github.com/radareorg/iaito)
project.

[![Crowdin](https://badges.crowdin.net/iaito/localized.svg)](https://crowdin.com/project/iaito)

## How does it work?

The `Translations.ts` file is uploaded regularly from [Iaito](https://github.com/radareorg/iaito) repository.

This will allow our translation platform [Crowdin](https://crowdin.com/project/iaito) to fetch new strings
and add them to their inner project to allow people to update their translations when new strings are added
into Iaito.

Once in a while, Crowdin will open a Pull Request in order to push newly translated strings.
Once those are merged into master, the submodule in Iaito repository can be updated and will allow to have
new translations for future releases.

## How to update the Translations.ts

This file is generated from the `iaito` repository.

```bash
$ lupdate src/Iaito.pro -ts Translations.ts
```

Copy this file into the root of `iaito-translations` and run `make`.

* The `all.zip` file will be generated and it's ready to be uploaded to Crowdin!

## How to help translating?

If anyone is willing to contribute, then please use the [Crowdin](https://crowdin.com/project/iaito) web interface to do so.

