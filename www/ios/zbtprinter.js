var exec = require('cordova/exec');

exports.print = function(mac, str, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, 'EpsilonPrinter', 'sendZplOverBluetooth', [mac, str]);
};

exports.skataAlert = function(mac, str, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, 'EpsilonPrinter', 'skataAlert', [mac, str]);
};

exports.skataAlert2 = function(mac, str, successCallback, errorCallback) {
options = {message:"skata",duration:"long",position:"center",data:{},addPixelsY:"0",styling:{opacity: 0.75,backgroundColor: '#FF0000',textColor: '#FFFF00',textSize: 20.5,cornerRadius: 16,horizontalPadding: 20 , verticalPadding: 16}};
    cordova.exec(successCallback, errorCallback, 'EpsilonPrinter', 'skataAlert2', [options]);
};