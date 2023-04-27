'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "42b3c20715fe958ce47a9c7c26eac3d0",
"splash/img/light-2x.png": "e89822ae3a1fe07c86edf128111333d6",
"splash/img/dark-4x.png": "11d4a3cbae175bd67517b083801a5824",
"splash/img/light-3x.png": "4ff2f94b29f39477e821ac4895332ed9",
"splash/img/dark-3x.png": "4ff2f94b29f39477e821ac4895332ed9",
"splash/img/light-4x.png": "11d4a3cbae175bd67517b083801a5824",
"splash/img/dark-2x.png": "e89822ae3a1fe07c86edf128111333d6",
"splash/img/dark-1x.png": "f02b9fdd1022cb5ac2a86aeb945116e2",
"splash/img/light-1x.png": "f02b9fdd1022cb5ac2a86aeb945116e2",
"splash/splash.js": "123c400b58bea74c1305ca3ac966748d",
"splash/style.css": "eed8ab0605bb07ab37ed372ce0794fbc",
"index.html": "88e54a1b28ccb3ebcbe51dd7dbf38df7",
"/": "88e54a1b28ccb3ebcbe51dd7dbf38df7",
"main.dart.js": "c372e959617e5db7fae8d935384eb323",
"flutter.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "bcfbee8acfdd184163afc0c2860f7c7f",
"assets/AssetManifest.json": "8b2f35173cff6d8a5c91e74b0365f630",
"assets/NOTICES": "3f620acc8c97682f685de9224bbaf7cc",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/assets/dark_icons/sessions_dark_icon.svg": "3a299136024cdd53d3c3db48210177b7",
"assets/assets/dark_icons/four_dark_icon.svg": "d71b4e40e6819656cfe4784c3ba0a67f",
"assets/assets/dark_icons/setting_dark_icon.svg": "04810664f60acff8fbd6cd03bbc1c063",
"assets/assets/dark_icons/qr_dark_icon.svg": "21e839cc209d1e6967bd373522877161",
"assets/assets/dark_icons/sessions_out_dark_icon.svg": "3a299136024cdd53d3c3db48210177b7",
"assets/assets/dark_icons/hide_dark_icon.svg": "db0e76628d711d30116eb99be209ec7c",
"assets/assets/dark_icons/filter_dark_icon.svg": "15ab07a1aa9a84c133abc8b3672ca15b",
"assets/assets/dark_icons/sort_dark_icon.svg": "e4075df59bdf05ca7c0d79c6123c714e",
"assets/assets/dark_icons/two_dark_icon.svg": "e0b0ef24014fff1e1aac1e4dae157882",
"assets/assets/dark_icons/notifications_dark_icon.svg": "d59bf939ddd6dd9e381149318b64ceff",
"assets/assets/images/person5_image.png": "e9fbcf006931fba89bd80e5a67261b82",
"assets/assets/images/person8_image.png": "015ad551fc752906182bc3068b8c6cc3",
"assets/assets/images/person3_image.png": "974a183b6aa3651575e3d6e7ba536942",
"assets/assets/images/person4_image.png": "fcfad96dcb2120ff6324aca08f851c50",
"assets/assets/images/person2_image.png": "91e6dd5bfd4f4dbb04c75270b5f38a89",
"assets/assets/images/related_devices_image.png": "9d36ca5bdfd9b46fbdabce0a47aede6c",
"assets/assets/images/person7_image.png": "6cced42e3dad4237f67447548143262f",
"assets/assets/images/person1_image.png": "4416482b630c92694b1b4e2374f168c1",
"assets/assets/images/person6_image.png": "5e3999fd2dadea04481ebabcf8d67843",
"assets/assets/icons/sessions_icon.svg": "a48b5249dc9e349c9489bcd63b585974",
"assets/assets/icons/clear_icon.svg": "7ecb404de7efdf2d78fc9b22247b22c9",
"assets/assets/icons/setting2_icon.svg": "b38d67a5c43a42b0d23b70bdc4a223e3",
"assets/assets/icons/search_icon.svg": "cbb965814a82c95df474896df8f9e464",
"assets/assets/icons/sun_icon.svg": "56f08c5e141e1756132d2b8af1b75c33",
"assets/assets/icons/sort_icon.svg": "7d7ab93ac3424310d033bd2091f06110",
"assets/assets/icons/four_icon.svg": "f6da2552aa3e771193a1ee8bfeb4ed9e",
"assets/assets/icons/hide_icon.svg": "b9fd5070f7ec8401e8c2225b8f5dab1a",
"assets/assets/icons/notifications_icon.svg": "fc1d9d262ce08be3548c3deb591f1689",
"assets/assets/icons/setting_person.svg": "eb32de9d751a25ea116ea1c02a0759a1",
"assets/assets/icons/moon_icon.svg": "03c5ffa70af82cb24efeed155735dc68",
"assets/assets/icons/setting_icon.svg": "78e8290e1a5e044094d6e6aa6185a410",
"assets/assets/icons/trash.svg": "8a7b247f5862ac778a9c3b44b2ccaa22",
"assets/assets/icons/list_icon.svg": "26d09142aede357b8ee181bdba88fd26",
"assets/assets/icons/dropdown_icon.svg": "341b3e92928ee25082ef06660de7f529",
"assets/assets/icons/back_icon.svg": "ac7e82c8fb36d5383995505c7ed5101c",
"assets/assets/icons/search2_icon.svg": "fa5626ae87003a236d495a7228e8d901",
"assets/assets/icons/qr_icon.svg": "b1d085fa5b19507a6fa9a8d529f42458",
"assets/assets/icons/filter_icon.svg": "5cd2d011174dd3c8a6646816ebf053c9",
"assets/assets/icons/logo_icon.svg": "d094b2c392b7ca0c28c68adcb770279f",
"assets/assets/icons/two_icon.svg": "92886ee36e5452e6646480f34b603cc8",
"assets/assets/icons/sessions_out_icon.svg": "a48b5249dc9e349c9489bcd63b585974",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
