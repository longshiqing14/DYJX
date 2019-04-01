/**
 * Created by zilong on 16/3/8.
 */
var xtt = (function(document, undefined) {
	//初始化
	var version = '1.1.8.0'; //版本号
	var launchFlag = null;
	var uiType = null;

	var clientId = null,
		certificateId = null,
		member = null,
		deviceToken = null;
	action = 'numberMarket';
	//action = 'myNumber,wallet,numberMarket';
	var serverRoot = 'http://www.xtt168.com:9000/zim/';
	//var serverRoot = 'http://192.168.0.110:9000/zim/';
	//var serverRoot = 'http://192.168.0.213:10001/XttLogistics/';
	//var serverRoot = 'http://192.168.1.213:10001/XttLogistics/';

	var device = 'H5';
	var host = 'HB'; //默认宿主为HB(HBuilder)
	var importedClass = null;
	var androidImportClassName = 'com.cjj.sungocar.manager.SCAccountManager';
	var iosImportClassName = 'SCAccountManager';
	//uiType = !uiType ? 'merchant' : uiType; //默认界面类型为物流商

	var $ = {
		launchFlag: launchFlag, //打开应用程序标志（不同版本号的标志不是一个）
		uiType: uiType, //UI界面类型
		clientId: clientId,
		certificateId: certificateId,
		action: action,
		member: member,
		serverRoot: serverRoot,
		inited: false,
		device: device,
		host: host,
		deviceToken: deviceToken,
		version: version //版本号
	};

	/**
	 * plusReady初始化，在用到H5+功能时必须先在mui.plusReady中调用
	 * 
	 */
	$.initPlusReady = function() {
		$.launchFlag = plus.storage.getItem('launchFlag-' + version);
		$.uiType = plus.storage.getItem('uiType');
		$.getClientId();
		//$.clientId = plus.storage.getItem('clientId');
		var s = plus.storage.getItem('member');
		if(s)
			$.member = JSON.parse(s);
		$.inited = true;
	};

	$.popNavigation = function() {
		if(importedClass) {
			importedClass.popNavigation();
		}
	}

	$.getClientId = function() {
		//获取导入对象
		try {
			importedClass = plus.android.importClass(androidImportClassName);
			if(importedClass)
				$.host = 'Android';
		} catch(err) {
			//console.log(err);
		}

		try {
			importedClass = plus.ios.importClass(iosImportClassName);
			if(importedClass)
				$.host = 'IOS';
		} catch(err) {
			//console.log(err);
		}

		//获取ClinetId
		if(importedClass) {
			$.clientId = importedClass.getClientId();
			$.certificateId = importedClass.getCertificateId();
			$.action = importedClass.getAction();
		} else {
			$.clientId = plus.storage.getItem('clientId');
			$.certificateId = plus.storage.getItem('certificateId');
			$.action = importedClass.getAction();
		}
		return $.clientId;
	};

	$.restart = function() {
		if(importedClass)
			importedClass.plusRestart();
		else
			plus.runtime.restart();
	};

	$.plusBack = function() {
		if(importedClass)
			importedClass.plusBack();
		// 		else
		// 				plus.runtime.restart();
	};

	$.plusInvoke = function(param) {
		var r = null;
		var defaultParam = {
			action: '',
			params: null
		}
		if(importedClass) {
			r = importedClass.plusInvoke(JSON.stringify(param));
		}
		return r;
	};

	/**
	 * 获取Member对象
	 * @returns {*}
	 */
	$.getMember = function() {
		var s = plus.storage.getItem('member');
		if(s)
			$.member = JSON.parse(s);
		return $.member;
	};

	/**
	 * 获取默认的网络提交参数，此操作必须要在initPlusReady方法后面调用
	 * @returns {{ClientId: *, Device: string, DeviceToken: *}}
	 */
	$.getDefaultParam = function() {
		return {
			ClientId: $.getClientId(),
			CertificateId: $.certificateId,
			Device: $.device,
			DeviceToken: $.deviceToken
		};
	};

	/**
	 * 保存登录状态
	 * @param clientId 客户端Id
	 * @param member 会员对象
	 */
	$.saveLoginStatus = function(clientId, member) {
		//console.log(clientId);
		plus.storage.setItem('clientId', clientId);
		$.clientId = clientId;
		plus.storage.setItem('member', JSON.stringify(member));
		$.member = member;
	};

	/**
	 * 保存CertificateId
	 * @param certificateId
	 */
	$.saveCertificateId = function(certificateId) {
		plus.storage.setItem('certificateId', certificateId);
		$.certificateId = certificateId;
	};

	/**
	 * 实时获取CertificateId
	 */
	$.getCertificateId = function() {
		return plus.storage.getItem('certificateId');
	};

	/**
	 * 实时获取打开应用程序标志（会根据不同版本号区分）
	 */
	$.getLaunchFlag = function() {
		return plus.storage.getItem('launchFlag-' + version);
	};

	/**
	 * 保存打开应用程序标志（会根据不同版本号区分）
	 * @param flag 打开标志（请使用字符串），'true'：已经打开过；'false'：未打开；
	 */
	$.saveLaunchFlag = function(flag) {
		plus.storage.setItem('launchFlag-' + $.version, flag);
		$.launchFlag = flag;
	};

	/**
	 * 保存UI界面类型
	 * @param uiType UI界面类型，可设置'customer', 'merchant'
	 */
	$.saveUIType = function(uiType) {
		plus.storage.setItem('uiType', uiType);
		$.uiType = uiType;
	};

	/**
	 * 实时获取UI界面类型
	 */
	$.getUIType = function() {
		return plus.storage.getItem('uiType');
	};

	//$.reLogin = function (webviewwId, loginUrl) {
	//    xtt.saveLoginStatus('', null);
	//    var login = plus.webview.getLaunchWebview();
	//    login.reload(true);
	//    login.setStyle({
	//        zindex: 0
	//    });
	//    login.show();
	//    //mui.later(function(){
	//        plus.webview.getWebviewById('merchant').close();
	//        plus.webview.getWebviewById('merchantMenu').close();
	//        //plus.webview.getWebviewById('orders.html').close();
	//        //plus.webview.getWebviewById('list-orders.html').close();
	//        //plus.webview.getWebviewById('customer.html').close();
	//        //plus.webview.getWebviewById('carCities').close();
	//        //plus.webview.getWebviewById('list-carCities').close();
	//        plus.webview.getWebviewById('customer').close();
	//    //}, 1000)
	//};

	/**
	 * extend(simple)
	 * @param {type} target
	 * @param {type} source
	 * @param {type} deep
	 * @returns {unresolved}
	 */
	$.extend = function() { //from jquery2
		var options, name, src, copy, copyIsArray, clone,
			target = arguments[0] || {},
			i = 1,
			length = arguments.length,
			deep = false;

		if(typeof target === "boolean") {
			deep = target;

			target = arguments[i] || {};
			i++;
		}

		if(typeof target !== "object" && !$.isFunction(target)) {
			target = {};
		}

		if(i === length) {
			target = this;
			i--;
		}

		for(; i < length; i++) {
			if((options = arguments[i]) != null) {
				for(name in options) {
					src = target[name];
					copy = options[name];

					if(target === copy) {
						continue;
					}

					if(deep && copy && ($.isPlainObject(copy) || (copyIsArray = $.isArray(copy)))) {
						if(copyIsArray) {
							copyIsArray = false;
							clone = src && $.isArray(src) ? src : [];

						} else {
							clone = src && $.isPlainObject(src) ? src : {};
						}

						target[name] = $.extend(deep, clone, copy);

					} else if(copy !== undefined) {
						target[name] = copy;
					}
				}
			}
		}

		return target;
	};

	//设置右滑返回
	$.setSwipeRightBack = function() {
		//右滑返回设置
		window.addEventListener('swiperight', function(e) {
			var detail = e.detail;
			if(Math.abs(detail.angle) < 8) {
				mui.back();
			}
		});
	};
	return $;
})(document);

//自动更新
(function($) {
	//需要远程加载的页面数组, 修改了更新方式，暂时弃用
	var remotePages = [
		//'/customer/index.html',
		//'/customer/index-menu.html',
		//'/customer/about.html' //关于页面
	];

	var remoteServer = 'http://www.xtt168.com:8090/remote/xttNumber';
	var updateUrl = 'http://www.xtt168.com:8090/update/xttNumber/update.json';

	$.extend({
		remoteServer: remoteServer, //远程页面服务器
		remotePages: remotePages, //需要调用远程的页面
		updateUrl: updateUrl //更新URL
	});

	/**
	 * 获取页面URL方法，将返回远程页面地址或者本地文件地址
	 * @param url 以"/"为根的页面路径
	 */
	$.pageUrl = function(url) {
		if(remotePages.indexOf(url) > -1) {
			//远程页面
			return remoteServer + url;
		} else {
			return 'file://' + plus.io.convertLocalFileSystemURL('_www' + url);
		}
	};

	/**
	 * 取得H5版本号
	 * @return String 版本号
	 */
	$.getH5Version = function() {
		var h5v = plus.storage.getItem('h5version');
		if(h5v)
			return plus.storage.getItem('h5version');
		else
			return xtt.version;
	};

	/**
	 * 保存H5版本号
	 * @param v String 版本号
	 */
	$.saveH5Version = function(v) {
		plus.storage.setItem('h5version', v);
	};
})(xtt);

//版本比较
(function($) {
	/**
	 * 版本比较 VersionCompare
	 * @param {String} currVer 当前版本.
	 * @param {String} promoteVer 比较版本.
	 * @return {int} 当前版本大于比较版本返回 1，等于返回 0，小于返回 -1。
	 *
	 * 使用
	 * VersionCompare("6.3","5.2.5"); // 1.
	 * VersionCompare("6.1", "6.1"); // 0.
	 * VersionCompare("6.1.5", "6.2"); // -1.
	 */
	$.versionCompare = function(currVer, promoteVer) {
		currVer = currVer || "0.0.0";
		promoteVer = promoteVer || "0.0.0";
		if(currVer == promoteVer) return 0;
		var currVerArr = currVer.split(".");
		var promoteVerArr = promoteVer.split(".");
		var len = Math.max(currVerArr.length, promoteVerArr.length);
		for(var i = 0; i < len; i++) {
			var proVal = ~~promoteVerArr[i],
				curVal = ~~currVerArr[i];
			if(proVal < curVal) {
				return 1;
			} else if(proVal > curVal) {
				return -1;
			}
		}
		return 0;
	};
})(xtt);

/**
 * md5
 */
(function($) {

	var rotateLeft = function(lValue, iShiftBits) {
		return(lValue << iShiftBits) | (lValue >>> (32 - iShiftBits));
	};

	var addUnsigned = function(lX, lY) {
		var lX4, lY4, lX8, lY8, lResult;
		lX8 = (lX & 0x80000000);
		lY8 = (lY & 0x80000000);
		lX4 = (lX & 0x40000000);
		lY4 = (lY & 0x40000000);
		lResult = (lX & 0x3FFFFFFF) + (lY & 0x3FFFFFFF);
		if(lX4 & lY4) return(lResult ^ 0x80000000 ^ lX8 ^ lY8);
		if(lX4 | lY4) {
			if(lResult & 0x40000000) return(lResult ^ 0xC0000000 ^ lX8 ^ lY8);
			else return(lResult ^ 0x40000000 ^ lX8 ^ lY8);
		} else {
			return(lResult ^ lX8 ^ lY8);
		}
	};

	var F = function(x, y, z) {
		return(x & y) | ((~x) & z);
	};

	var G = function(x, y, z) {
		return(x & z) | (y & (~z));
	};

	var H = function(x, y, z) {
		return(x ^ y ^ z);
	};

	var I = function(x, y, z) {
		return(y ^ (x | (~z)));
	};

	var FF = function(a, b, c, d, x, s, ac) {
		a = addUnsigned(a, addUnsigned(addUnsigned(F(b, c, d), x), ac));
		return addUnsigned(rotateLeft(a, s), b);
	};

	var GG = function(a, b, c, d, x, s, ac) {
		a = addUnsigned(a, addUnsigned(addUnsigned(G(b, c, d), x), ac));
		return addUnsigned(rotateLeft(a, s), b);
	};

	var HH = function(a, b, c, d, x, s, ac) {
		a = addUnsigned(a, addUnsigned(addUnsigned(H(b, c, d), x), ac));
		return addUnsigned(rotateLeft(a, s), b);
	};

	var II = function(a, b, c, d, x, s, ac) {
		a = addUnsigned(a, addUnsigned(addUnsigned(I(b, c, d), x), ac));
		return addUnsigned(rotateLeft(a, s), b);
	};

	var convertToWordArray = function(string) {
		var lWordCount;
		var lMessageLength = string.length;
		var lNumberOfWordsTempOne = lMessageLength + 8;
		var lNumberOfWordsTempTwo = (lNumberOfWordsTempOne - (lNumberOfWordsTempOne % 64)) / 64;
		var lNumberOfWords = (lNumberOfWordsTempTwo + 1) * 16;
		var lWordArray = Array(lNumberOfWords - 1);
		var lBytePosition = 0;
		var lByteCount = 0;
		while(lByteCount < lMessageLength) {
			lWordCount = (lByteCount - (lByteCount % 4)) / 4;
			lBytePosition = (lByteCount % 4) * 8;
			lWordArray[lWordCount] = (lWordArray[lWordCount] | (string.charCodeAt(lByteCount) << lBytePosition));
			lByteCount++;
		}
		lWordCount = (lByteCount - (lByteCount % 4)) / 4;
		lBytePosition = (lByteCount % 4) * 8;
		lWordArray[lWordCount] = lWordArray[lWordCount] | (0x80 << lBytePosition);
		lWordArray[lNumberOfWords - 2] = lMessageLength << 3;
		lWordArray[lNumberOfWords - 1] = lMessageLength >>> 29;
		return lWordArray;
	};

	var wordToHex = function(lValue) {
		var WordToHexValue = "",
			WordToHexValueTemp = "",
			lByte, lCount;
		for(lCount = 0; lCount <= 3; lCount++) {
			lByte = (lValue >>> (lCount * 8)) & 255;
			WordToHexValueTemp = "0" + lByte.toString(16);
			WordToHexValue = WordToHexValue + WordToHexValueTemp.substr(WordToHexValueTemp.length - 2, 2);
		}
		return WordToHexValue;
	};

	var uTF8Encode = function(string) {
		string = string.replace(/\x0d\x0a/g, "\x0a");
		var output = "";
		for(var n = 0; n < string.length; n++) {
			var c = string.charCodeAt(n);
			if(c < 128) {
				output += String.fromCharCode(c);
			} else if((c > 127) && (c < 2048)) {
				output += String.fromCharCode((c >> 6) | 192);
				output += String.fromCharCode((c & 63) | 128);
			} else {
				output += String.fromCharCode((c >> 12) | 224);
				output += String.fromCharCode(((c >> 6) & 63) | 128);
				output += String.fromCharCode((c & 63) | 128);
			}
		}
		return output;
	};

	$.extend({
		md5: function(string) {
			var x = Array();
			var k, AA, BB, CC, DD, a, b, c, d;
			var S11 = 7,
				S12 = 12,
				S13 = 17,
				S14 = 22;
			var S21 = 5,
				S22 = 9,
				S23 = 14,
				S24 = 20;
			var S31 = 4,
				S32 = 11,
				S33 = 16,
				S34 = 23;
			var S41 = 6,
				S42 = 10,
				S43 = 15,
				S44 = 21;
			string = uTF8Encode(string);
			x = convertToWordArray(string);
			a = 0x67452301;
			b = 0xEFCDAB89;
			c = 0x98BADCFE;
			d = 0x10325476;
			for(k = 0; k < x.length; k += 16) {
				AA = a;
				BB = b;
				CC = c;
				DD = d;
				a = FF(a, b, c, d, x[k + 0], S11, 0xD76AA478);
				d = FF(d, a, b, c, x[k + 1], S12, 0xE8C7B756);
				c = FF(c, d, a, b, x[k + 2], S13, 0x242070DB);
				b = FF(b, c, d, a, x[k + 3], S14, 0xC1BDCEEE);
				a = FF(a, b, c, d, x[k + 4], S11, 0xF57C0FAF);
				d = FF(d, a, b, c, x[k + 5], S12, 0x4787C62A);
				c = FF(c, d, a, b, x[k + 6], S13, 0xA8304613);
				b = FF(b, c, d, a, x[k + 7], S14, 0xFD469501);
				a = FF(a, b, c, d, x[k + 8], S11, 0x698098D8);
				d = FF(d, a, b, c, x[k + 9], S12, 0x8B44F7AF);
				c = FF(c, d, a, b, x[k + 10], S13, 0xFFFF5BB1);
				b = FF(b, c, d, a, x[k + 11], S14, 0x895CD7BE);
				a = FF(a, b, c, d, x[k + 12], S11, 0x6B901122);
				d = FF(d, a, b, c, x[k + 13], S12, 0xFD987193);
				c = FF(c, d, a, b, x[k + 14], S13, 0xA679438E);
				b = FF(b, c, d, a, x[k + 15], S14, 0x49B40821);
				a = GG(a, b, c, d, x[k + 1], S21, 0xF61E2562);
				d = GG(d, a, b, c, x[k + 6], S22, 0xC040B340);
				c = GG(c, d, a, b, x[k + 11], S23, 0x265E5A51);
				b = GG(b, c, d, a, x[k + 0], S24, 0xE9B6C7AA);
				a = GG(a, b, c, d, x[k + 5], S21, 0xD62F105D);
				d = GG(d, a, b, c, x[k + 10], S22, 0x2441453);
				c = GG(c, d, a, b, x[k + 15], S23, 0xD8A1E681);
				b = GG(b, c, d, a, x[k + 4], S24, 0xE7D3FBC8);
				a = GG(a, b, c, d, x[k + 9], S21, 0x21E1CDE6);
				d = GG(d, a, b, c, x[k + 14], S22, 0xC33707D6);
				c = GG(c, d, a, b, x[k + 3], S23, 0xF4D50D87);
				b = GG(b, c, d, a, x[k + 8], S24, 0x455A14ED);
				a = GG(a, b, c, d, x[k + 13], S21, 0xA9E3E905);
				d = GG(d, a, b, c, x[k + 2], S22, 0xFCEFA3F8);
				c = GG(c, d, a, b, x[k + 7], S23, 0x676F02D9);
				b = GG(b, c, d, a, x[k + 12], S24, 0x8D2A4C8A);
				a = HH(a, b, c, d, x[k + 5], S31, 0xFFFA3942);
				d = HH(d, a, b, c, x[k + 8], S32, 0x8771F681);
				c = HH(c, d, a, b, x[k + 11], S33, 0x6D9D6122);
				b = HH(b, c, d, a, x[k + 14], S34, 0xFDE5380C);
				a = HH(a, b, c, d, x[k + 1], S31, 0xA4BEEA44);
				d = HH(d, a, b, c, x[k + 4], S32, 0x4BDECFA9);
				c = HH(c, d, a, b, x[k + 7], S33, 0xF6BB4B60);
				b = HH(b, c, d, a, x[k + 10], S34, 0xBEBFBC70);
				a = HH(a, b, c, d, x[k + 13], S31, 0x289B7EC6);
				d = HH(d, a, b, c, x[k + 0], S32, 0xEAA127FA);
				c = HH(c, d, a, b, x[k + 3], S33, 0xD4EF3085);
				b = HH(b, c, d, a, x[k + 6], S34, 0x4881D05);
				a = HH(a, b, c, d, x[k + 9], S31, 0xD9D4D039);
				d = HH(d, a, b, c, x[k + 12], S32, 0xE6DB99E5);
				c = HH(c, d, a, b, x[k + 15], S33, 0x1FA27CF8);
				b = HH(b, c, d, a, x[k + 2], S34, 0xC4AC5665);
				a = II(a, b, c, d, x[k + 0], S41, 0xF4292244);
				d = II(d, a, b, c, x[k + 7], S42, 0x432AFF97);
				c = II(c, d, a, b, x[k + 14], S43, 0xAB9423A7);
				b = II(b, c, d, a, x[k + 5], S44, 0xFC93A039);
				a = II(a, b, c, d, x[k + 12], S41, 0x655B59C3);
				d = II(d, a, b, c, x[k + 3], S42, 0x8F0CCC92);
				c = II(c, d, a, b, x[k + 10], S43, 0xFFEFF47D);
				b = II(b, c, d, a, x[k + 1], S44, 0x85845DD1);
				a = II(a, b, c, d, x[k + 8], S41, 0x6FA87E4F);
				d = II(d, a, b, c, x[k + 15], S42, 0xFE2CE6E0);
				c = II(c, d, a, b, x[k + 6], S43, 0xA3014314);
				b = II(b, c, d, a, x[k + 13], S44, 0x4E0811A1);
				a = II(a, b, c, d, x[k + 4], S41, 0xF7537E82);
				d = II(d, a, b, c, x[k + 11], S42, 0xBD3AF235);
				c = II(c, d, a, b, x[k + 2], S43, 0x2AD7D2BB);
				b = II(b, c, d, a, x[k + 9], S44, 0xEB86D391);
				a = addUnsigned(a, AA);
				b = addUnsigned(b, BB);
				c = addUnsigned(c, CC);
				d = addUnsigned(d, DD);
			}
			var tempValue = wordToHex(a) + wordToHex(b) + wordToHex(c) + wordToHex(d);
			return tempValue.toLowerCase();
		}
	});
})(xtt);