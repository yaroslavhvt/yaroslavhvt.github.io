var FindProxyForURL = function(init, profiles) {
    return function(url, host) {
        "use strict";
        var result = init, scheme = url.substr(0, url.indexOf(":"));
        do {
            result = profiles[result];
            if (typeof result === "function") result = result(url, host, scheme);
        } while (typeof result !== "string" || result.charCodeAt(0) === 43);
        return result;
    };
}("+Switch", {
    "+Switch": function(url, host, scheme) {
        "use strict";
        if (/^4pda\.to$/.test(host)) return "+Tor";
        if (/yandex\.ru$/.test(host)) return "+Adblock";
        if (/dzen\.ru$/.test(host)) return "+Adblock";
        if (/(?:^|\.)doubleclick\.net$/.test(host)) return "+Adblock";
        if (/(?:^|\.)2mdn\.net$/.test(host)) return "+Adblock";
        return "DIRECT";
    },
    "+Tor": function(url, host, scheme) {
        "use strict";
        return "SOCKS5 127.0.0.1:9050; SOCKS 127.0.0.1:9050";
    },
    "+Adblock": function(url, host, scheme) {
        "use strict";
        return "PROXY 127.0.0.1:53";
    }
});
