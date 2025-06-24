#!/bin/bash
set -e

CONVERTER_NAME=$(basename "$0" .sh)
CONVERTER_DIR="./converters"

if [ ! -f "$CONVERTER_DIR/$CONVERTER_NAME/convert.sh" ]; then
    echo "Конвертера $CONVERTER_NAME в директории $CONVERTER_DIR не найдено"
    exit 1
fi

pushd "$CONVERTER_DIR/$CONVERTER_NAME"
    /bin/bash convert.sh
popd

exit 0