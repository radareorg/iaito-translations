#!/bin/sh
###
# Generate cutter_xx.ts from the crowdin build.zip file
###

CROWDIN_FN="Cutter.zip"

# Make sure file is available
if [ ! -f "${CROWDIN_FN}" ]; then
    echo "${CROWDIN_FN} not found. Exiting."
    exit 1
fi

# If so, make a temp dir and work from there
TMPDIR=$(mktemp -d)
unzip "${CROWDIN_FN}" -d "${TMPDIR}" >/dev/null
for folder in ${TMPDIR}/*; do
    bn=$(basename ${folder})
    cp "${folder}/Translation.ts" "./cutter_${bn}.ts"
done

# Clean temporary folder
rm -rf ${TMPDIR}

# Some hack because I probably don't know how to configure crowdin
# Or because the way Cutter loads the translations is wrong
mv cutter_es-ES.ts cutter_es.ts
mv cutter_pt-PT.ts cutter_pt.ts
mv cutter_zh-CN.ts cutter_cn.ts
