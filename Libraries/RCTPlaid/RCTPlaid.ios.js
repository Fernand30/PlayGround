/**
 * @providesModule RCTPlaid
 * @flow
 */
'use strict';

var NativeRCTPlaid = require('NativeModules').RCTPlaid;

/**
 * High-level docs for the RCTPlaid iOS API can be written here.
 */

var RCTPlaid = {
  test: function() {
    NativeRCTPlaid.test();
  }
};

module.exports = RCTPlaid;
