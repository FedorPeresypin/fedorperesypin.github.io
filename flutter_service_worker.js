'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "737815e9af778c9fafa13b303e9c9139",
"version.json": "0cb9b9bff919d6d925d4f5b381be2e9f",
"index.html": "130dff232f5ca605020c0baaa8c1d3cd",
"/": "130dff232f5ca605020c0baaa8c1d3cd",
"main.dart.js": "b7cc8adf12f976ef16db19bcce9122ac",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "b6edfd2223615873c61c162f6ffea332",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/favicon.png": "b6edfd2223615873c61c162f6ffea332",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "98ddb61c0c17830fd9e033734756bf96",
"assets/AssetManifest.json": "3f748ef065278aab8cc6904ee31c437c",
"assets/NOTICES": "c1fb451f929db671a90363647a68cb4c",
"assets/FontManifest.json": "f844dc11463693f392b8c2e404f5b520",
"assets/AssetManifest.bin.json": "48d6e4392d32bbbd4c3ec142198939c8",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "12c732b0f5a7101eba4c796e4722c167",
"assets/fonts/SFProText-Heavy.ttf": "6c498791e52ee77eedea219f291f638d",
"assets/fonts/SFProText-Semibold.ttf": "1a131c948d598ecec700d37d168a15b5",
"assets/fonts/SFProText-Regular.ttf": "85bd46c1cff02c1d8360cc714b8298fa",
"assets/fonts/MaterialIcons-Regular.otf": "7e8d2f3f03b55fdff7a207bf867a7261",
"assets/assets/images/logo.gif": "adaa5c46a19b74979fe73a8eb41204e3",
"assets/assets/images/phone_4.png": "2586a674316da5c2338e13d2bd372509",
"assets/assets/images/screen_2.png": "7b7da8c7d59a39506961bc84d9eabb72",
"assets/assets/images/phone_1.png": "ef7a92380f56cbe395d7242d77fce2d8",
"assets/assets/images/screen_3.png": "2396acd26c559ebf30d88d541d28bc63",
"assets/assets/images/screen_1.png": "cb726748b8564b3ceea76a1730c71b09",
"assets/assets/images/phone_2.png": "c2af84ed184290d65f7594aa227546e9",
"assets/assets/images/phone_3.png": "16fa62245f76dd0f085769ba747b6944",
"assets/assets/images/instruction_3.png": "8d9b1c6bc727636c0908eab0d77f63a7",
"assets/assets/images/instruction_2.png": "849f71a4d0670621512a109a36d9ed89",
"assets/assets/images/logo.png": "566809c79e34c4bb6d6834c3bfc760d0",
"assets/assets/images/instruction_1.png": "bc765b04ff5aa16283af82c3a0bc95d5",
"assets/assets/icons/checkmark.svg": "5f911a39d0daabbc001db16038ec6513",
"assets/assets/icons/doc.on.doc.svg": "637f1d2fc2f6a1f001bd91eaa50f3f81",
"assets/assets/icons/envelope.svg": "159ab6e60b7dbfa29f16ce53d052e0e2",
"assets/assets/icons/plus.svg": "4c7c1619c9b922ec00a635cb34b829fc",
"assets/assets/icons/logo.fill.svg": "a62c1b5ca467341a385513da2523005d",
"assets/assets/icons/send.svg": "7ac1ed05f6892268512d4e7ff60fd3e4",
"assets/assets/icons/phone.svg": "6a2d573c4457eb36e775ce629acd4c1e",
"assets/assets/icons/suitcase.svg": "9d7f5c93e9ce6a64b03bee995a7e348a",
"assets/assets/icons/logo.svg": "dc77c481cfe2c78a533fc22371e5f31f",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
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
