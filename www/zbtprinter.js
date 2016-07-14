var exec = require('cordova/exec');

exports.print = function(mac, str, language, successCallback, errorCallback) {
language += str;
    cordova.exec(successCallback, errorCallback, 'ZebraBluetoothPrinter', 'print', [mac, language]);
};

exports.find = function(successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, 'ZebraBluetoothPrinter', 'find', []);
};

