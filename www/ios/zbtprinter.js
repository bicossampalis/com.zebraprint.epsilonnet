var exec = require('cordova/exec');

exports.print = function(mac, str, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, 'MfiBtPrinterConnection', 'sendZplOverBluetooth', [mac, str]);
};

