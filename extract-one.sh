#!/bin/bash -x

NUM_ARGS=$#

function usage {
    echo "Usage: $0 /path/to/foo.zip"
    exit 1
}

if [ $NUM_ARGS -ne 1 ]; then
    usage
fi

ZIP_FILE=$1

# does not end with zip
if [[ ! ${ZIP_FILE} == *.zip ]]; then
    usage
fi

CONTAINING_DIR=`dirname ${ZIP_FILE}`
echo containing dir is ${CONTAINING_DIR}

MIDDLE_DIR=`basename -s .zip ${ZIP_FILE}`
echo middle dir is ${MIDDLE_DIR}

EXTRACT_DIR="${CONTAINING_DIR}/${MIDDLE_DIR}"
echo EXTRACT_DIR is ${EXTRACT_DIR}

unzip -d ${EXTRACT_DIR} ${ZIP_FILE}
rm ${ZIP_FILE}
