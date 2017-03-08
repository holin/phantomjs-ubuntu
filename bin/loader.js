var page = require('webpage').create(),
  system = require('system'),
  t, address;

page.viewportSize = { width: 1600, height: 1000 };

if (system.args.length === 1) {
  console.log('Usage: loader.js <some URL>');
  phantom.exit();
}

page.onCallback = function(data) {
  console.log('CALLBACK: ' + JSON.stringify(data));
  if (!data.log) {
    setTimeout(function() {
      screenshots(address)
      phantom.exit();
    }, 1);
  }
};

page.customHeaders = {
  "Referer": "http://courseware.aixuexi.com",
  // "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36"
};

page.settings.resourceTimeout = 30000; // 30 seconds

t = Date.now();
address = system.args[1];
page.open(address, function(status) {
  if (status !== 'success') {
    console.log('FAIL to load the address');
  } else {
    t = Date.now() - t;
    console.log('Loading ' + system.args[1]);
    console.log('Loading time ' + t + ' msec');
  }
});

function screenshots(address) {
  id = parseInt(address.split("id=")[1])
  page.render("/tmp/screenshots/" + id + ".png");
}
