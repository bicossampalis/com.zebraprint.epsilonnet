var exec = require('cordova/exec');

exports.print = function(mac, str, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, 'EpsilonPrinter', 'sendZplOverBluetooth', [mac, str]);
};

exports.skataAlert = function(mac, str, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, 'EpsilonPrinter', 'skataAlert', [mac, str]);
};