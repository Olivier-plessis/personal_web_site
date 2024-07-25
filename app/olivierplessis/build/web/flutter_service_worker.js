'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "e204f5a9bc7fb73767e638f8a4a1abe0",
"version.json": "e33217a0a9bf828dd10212f337e56df9",
"index.html": "e10a42cd60dfdc8d6036e397bc32bcc1",
"/": "e10a42cd60dfdc8d6036e397bc32bcc1",
"main.dart.js": "1c26ecae0aad9e943c9dabe9eb4c735e",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"favicon.png": "d643bc56cee1d90b0ffa9a3d52917001",
"icons/apple-touch-icon.png": "6fcb41c107b4977b92f6ff8cd5bcee0e",
"icons/Icon-192.png": "43a4c0fa94f87da6187c1addd59298da",
"icons/Icon-maskable-192.png": "43a4c0fa94f87da6187c1addd59298da",
"icons/favicon.png": "d643bc56cee1d90b0ffa9a3d52917001",
"icons/Icon-maskable-512.png": "74abc170ef17671b3634156718b8c167",
"icons/Icon-512.png": "3bc6485a1fe774dace99a763b9443559",
"icons/favicon-32x32.png": "18f94632b5c0cdf66732bfaa57a8daff",
"manifest.json": "ef791ffb84d69c5000d1df8265efba18",
"assets/AssetManifest.json": "3f452f82db1d7ee531d65706eb55ac3e",
"assets/NOTICES": "94aaaff3d4e14cf9d3df300ba72d6533",
"assets/FontManifest.json": "dab3eda4f4a31c5d9cd0b564b24b456f",
"assets/AssetManifest.bin.json": "9d4f063d21c0b3258299c44503174058",
"assets/packages/design_ui/assets/images/branding/photo.webp": "f92095bc3ec5ed4f319ca174b96991ac",
"assets/packages/design_ui/assets/images/branding/contact_blue.png": "5e007295c6ded2dc401abc68d20d983a",
"assets/packages/design_ui/assets/images/branding/icon_header.png": "68263b3fa3c7870e0c4b42bd4d0ca43d",
"assets/packages/design_ui/assets/images/branding/fill_phone_header.png": "ae166f27539d1963bd63b4266c482be5",
"assets/packages/design_ui/assets/images/branding/phone_header.png": "76726ec995bbb1a6eaa5bc8a9a2cf723",
"assets/packages/design_ui/assets/images/work/br-units-logo.png": "8bf129114d898251e6cf6cb81ea41880",
"assets/packages/design_ui/assets/images/work/sublim-logo.png": "38d66f3ffb582ce2cdf499c4bc2a937e",
"assets/packages/design_ui/assets/images/work/lpcr-logo.png": "5096e428d91c138f26bd6f6caf3e2051",
"assets/packages/design_ui/assets/images/work/br-units-banner.webp": "696f9bcb9a8996bca89e43caf573a488",
"assets/packages/design_ui/assets/images/work/cureety-logo.png": "0ca21cc9b82f657d190dac72fcced660",
"assets/packages/design_ui/assets/images/work/lpcr-banner.webp": "811a307eacec915d6a45e948c90d17f7",
"assets/packages/design_ui/assets/images/work/lisa-banner.webp": "8512b0b2e83c6b9af6b19b8e27212128",
"assets/packages/design_ui/assets/images/work/projet-cureety.png": "2664869fdba194243b3a16a3b1ccab82",
"assets/packages/design_ui/assets/images/work/tada-logo.png": "d27be550fac818be92e4b3ceb2b03753",
"assets/packages/design_ui/assets/images/work/la-mobilery-logo.png": "bb5253dd53925ee6b911f22ed0baa1f5",
"assets/packages/design_ui/assets/images/work/lisa-logo.png": "21c03836e2eeb38a3b21f0435706b19d",
"assets/packages/design_ui/assets/images/work/tada-banner.webp": "d4c4b27061e694487c234285b4eaf841",
"assets/packages/design_ui/assets/images/icons/appstore.svg": "556bc177d3df270f344895a6586c7f41",
"assets/packages/design_ui/assets/images/icons/github.svg": "7cbac3558a11b75971a34bd987a075fc",
"assets/packages/design_ui/assets/images/icons/plus.svg": "f7ba22495afff51882242b1db0287307",
"assets/packages/design_ui/assets/images/icons/googleplay.svg": "47d63ac3bb84bb635922603ed51f21e7",
"assets/packages/design_ui/assets/images/icons/green_logo.png": "efa5872d6abd2f2c9c711bd21eb895c3",
"assets/packages/design_ui/assets/images/icons/linkedin.svg": "91e67fa37a37361fd993f71d04410a50",
"assets/packages/design_ui/assets/images/icons/twitter.svg": "d650fd4a007333be073f700be180be8d",
"assets/packages/design_ui/assets/font/Poppins-Light.ttf": "fcc40ae9a542d001971e53eaed948410",
"assets/packages/design_ui/assets/font/Poppins-Medium.ttf": "bf59c687bc6d3a70204d3944082c5cc0",
"assets/packages/design_ui/assets/font/Poppins-ExtraBold.ttf": "d45bdbc2d4a98c1ecb17821a1dbbd3a4",
"assets/packages/design_ui/assets/font/Poppins-Regular.ttf": "093ee89be9ede30383f39a899c485a82",
"assets/packages/design_ui/assets/font/Poppins-Bold.ttf": "08c20a487911694291bd8c5de41315ad",
"assets/packages/design_ui/assets/font/Poppins-Thin.ttf": "9ec263601ee3fcd71763941207c9ad0d",
"assets/packages/design_ui/assets/font/Poppins-SemiBold.ttf": "6f1520d107205975713ba09df778f93f",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "338549655f6f68f1ee6d4b40e4b0a3d5",
"assets/fonts/MaterialIcons-Regular.otf": "a31c70a03961ce35ac38c672c938b079",
"assets/assets/data/data.json": "71686115cdd35e6a17c86a542c5c1b6b",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
