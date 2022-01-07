#!/bin/sh

#######################################################################
# This program and the accompanying materials are made available
# under the terms of the Eclipse Public License v2.0 which
# accompanies this distribution, and is available at
# https://www.eclipse.org/legal/epl-v20.html
#
# SPDX-License-Identifier: EPL-2.0
#
# Copyright Contributors to the Zowe Project.
#######################################################################

print_level1_message "Connect existing certificate to Zowe keyring"

###############################
# constants

###############################
# validation

###############################
# run ZWEKRING JCL
ZWE_PRIVATE_ZOSMF_USER="${ZWE_CLI_PARAMETER_ZOSMF_USER}" \
  keyring_run_zwekring_jcl \
    "${ZWE_CLI_PARAMETER_HLQ}" \
    "${ZWE_CLI_PARAMETER_JCLLIB}" \
    2 \
    "${ZWE_CLI_PARAMETER_KEYRING_OWNER}" \
    "${ZWE_CLI_PARAMETER_KEYRING_NAME}" \
    "" \
    "" \
    "" \
    "${ZWE_CLI_PARAMETER_EXTERNAL_CAS}" \
    "${ZWE_CLI_PARAMETER_TRUST_ZOSMF}" \
    "${ZWE_CLI_PARAMETER_ZOSMF_CA}" \
    "${ZWE_CLI_PARAMETER_CONNECT_USER}" \
    "${ZWE_CLI_PARAMETER_CONNECT_LABEL}" \
    "" \
    "" \
    "" \
    "${ZWE_CLI_PARAMETER_IMPORT_SECURITY_PRODUCT}"
code=$?
if [ ${code} -ne 0 ]; then
  return ${code}
fi

###############################
# exit message
print_level2_message "Certificate is connect to Zowe keyring successfully."
