#!/bin/sh
cp "${PROJECT_DIR}"/Carthage/Build/iOS/LinkKit.framework/prepare_for_distribution.sh "${CONFIGURATION_BUILD_DIR}"/LinkKit.framework/prepare_for_distribution.sh
"${CONFIGURATION_BUILD_DIR}"/LinkKit.framework/prepare_for_distribution.sh
