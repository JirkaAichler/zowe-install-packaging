/**
 * This program and the accompanying materials are made available under the terms of the
 * Eclipse Public License v2.0 which accompanies this distribution, and is available at
 * https://www.eclipse.org/legal/epl-v20.html
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Copyright IBM Corporation 2020
 */

import {
  checkMandatoryEnvironmentVariables,
  installAndGenerateApiDocs,
} from '../../utils';
  import {
    SSO_USE_GSKKYMAN, TEST_TIMEOUT_CONVENIENCE_BUILD,
  ZOWE_TOKEN_LABEL,
  ZOWE_TOKEN_NAME
} from '../../constants';
  
  const testSuiteName = 'Test convenience build installation';
  describe(testSuiteName, () => {
    beforeAll(() => {
      // validate variables
      checkMandatoryEnvironmentVariables([
        'TEST_SERVER',
        'ZOWE_BUILD_LOCAL',
      ]);
    });
  
    test('install and generate api documentation', async () => {
      await installAndGenerateApiDocs(
        testSuiteName,
        process.env.TEST_SERVER,
        {
          'zowe_build_local': process.env['ZOWE_BUILD_LOCAL'],
          'zowe_lock_keystore': 'false',
          'zowe_token_name': ZOWE_TOKEN_NAME,
          'zowe_token_label': ZOWE_TOKEN_LABEL,
          'sso_use_gskkyman': SSO_USE_GSKKYMAN,
        }
      );
    }, TEST_TIMEOUT_CONVENIENCE_BUILD);
  });
