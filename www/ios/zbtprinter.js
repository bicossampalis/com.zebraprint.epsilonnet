var exec = require('cordova/exec');

exports.print = function(mac, str, language, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, 'ZebraBluetoothPrinter', 'changeLanguage', [mac, str,language]);
};

exports.skataAlert = function(mac, str, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, 'ZebraBluetoothPrinter', 'skataAlert', [mac, str]);
};

exports.findPrinter = function(mac, str,successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, 'ZebraBluetoothPrinter', 'findPrinter', [mac, str]);
};