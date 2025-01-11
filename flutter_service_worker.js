'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "1eda7960d933d8b306d160e99797c2dd",
"version.json": "e26b95386d4d12c0d8407326a5f590c6",
"index.html": "0c5b8e5db4a99ae05dc2601599579812",
"/": "0c5b8e5db4a99ae05dc2601599579812",
"main.dart.js": "163df56c920686faf20926561b400ea7",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "b6edfd2223615873c61c162f6ffea332",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/favicon.png": "b6edfd2223615873c61c162f6ffea332",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "aabd20d9437fd76f485a29472350f1cb",
"assets/AssetManifest.json": "715a4b97070c7218a021cb4eee8e3526",
"assets/NOTICES": "65bfb7fc4a25ff01e470c0d6b90678b5",
"assets/FontManifest.json": "f844dc11463693f392b8c2e404f5b520",
"assets/AssetManifest.bin.json": "9be288de69e3b71e4bef10aca73a986b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "be85bdfb8502221bd85f4cab3c8f6c02",
"assets/packages/wakelock_plus/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "e68216d0d25114a9a392d523d05d15f9",
"assets/fonts/SFProText-Heavy.ttf": "6c498791e52ee77eedea219f291f638d",
"assets/fonts/SFProText-Semibold.ttf": "1a131c948d598ecec700d37d168a15b5",
"assets/fonts/SFProText-Regular.ttf": "85bd46c1cff02c1d8360cc714b8298fa",
"assets/fonts/MaterialIcons-Regular.otf": "79e63b33b611ac5223adaf95357bcd25",
"assets/assets/logo.gif": "adaa5c46a19b74979fe73a8eb41204e3",
"assets/assets/images/related_devices_image.png": "9d36ca5bdfd9b46fbdabce0a47aede6c",
"assets/assets/images/recomendation.svg": "7a60e801380db18950de9f267886a676",
"assets/assets/logo.png": "39f4e4f96c39e73417a0546f38ae7bb5",
"assets/assets/logo_start.svg": "7ff0f1ac36b846e24c8c9d67dc66575e",
"assets/assets/logo_mp4_7.json": "a427afda587e1a4a0aff33967aa47764",
"assets/assets/icon/doc.on.doc.fill.svg": "6b1014c7780a493adf464cbfa9a01d4f",
"assets/assets/icon/play.rectangle.on.rectangle.svg": "105fed23508b15841fbb845ed16c7b27",
"assets/assets/icon/checkmark.svg": "5f911a39d0daabbc001db16038ec6513",
"assets/assets/icon/arrow.turn.left.up.svg": "ec0bfc700cd2fc325775aa090d9583a3",
"assets/assets/icon/eye.slash.fill.svg": "7729a31bb62c6ca0d82329068b45fcd6",
"assets/assets/icon/location.pin.fill.svg": "325cf7cf48218ef8734a0126c83a77cd",
"assets/assets/icon/exclamationmark.circle.fill.svg": "268583220a7b28057d2551d6433d36a6",
"assets/assets/icon/hand.thumbsdown.svg": "f7a5e25d108a26dd60d13967eef1575b",
"assets/assets/icon/square.fill.svg": "78c8c543369c483018abeb390a32d592",
"assets/assets/icon/arrow.turn.right.up.svg": "59518462ef5f1528fe528b33a0df6394",
"assets/assets/icon/rectangle.and.hand.point.up.left.svg": "c93f3d4be329698dff0a38120a39aa30",
"assets/assets/icon/circle.svg": "031bc3fbbca6c5529666175529309022",
"assets/assets/icon/person.svg": "b6910613e327416c5a9465c461aa61a2",
"assets/assets/icon/eye.fill.svg": "555bce184ebc15bc92395a5f62c71f2c",
"assets/assets/icon/eye.slash.svg": "d756eb3c89f47d95161bc71b1367183d",
"assets/assets/icon/arrow.down.to.line.alt.svg": "981236e91153536df32d2c816824a561",
"assets/assets/icon/app_icon.png": "7bc74793d9c974b6c9b8fd9c1de2a925",
"assets/assets/icon/doc.on.doc.svg": "637f1d2fc2f6a1f001bd91eaa50f3f81",
"assets/assets/icon/checkmark.shield.svg": "4ca4d7496ab584d1d3cba4fb6cf9d99b",
"assets/assets/icon/hand.tap.svg": "b172ec18f3e46805064cd6addbd5bd9e",
"assets/assets/icon/bubble.left.fill.svg": "9ff342e07d1c4edff49437c794ae113c",
"assets/assets/icon/hand.tap.fill.svg": "a6ce0c44204c2749769ab18b048f47f7",
"assets/assets/icon/person.crop.rectangle.svg": "caa8da0612f37438f9951b83a734df7e",
"assets/assets/icon/rectangle.filled.and.hand.point.up.left.svg": "b9693594cc675842cb75c0333a252cc4",
"assets/assets/icon/speaker.slash.svg": "5ddf1abb67d1d9bbb1e425634eb88236",
"assets/assets/icon/persons.crop.square.filled.rectangle.fill.svg": "a80558cefe4bc6f5a2e50e82054192d5",
"assets/assets/icon/envelope.svg": "159ab6e60b7dbfa29f16ce53d052e0e2",
"assets/assets/icon/persons.crop.square.filled.rectangle.svg": "993f7fe4b6a6e32dfada1062ace4a2f8",
"assets/assets/icon/rows.fill.svg": "7394648efdff87102e310014fc67a235",
"assets/assets/icon/envelope.fill.svg": "436653ec503825af8a3fb8b1a03587f4",
"assets/assets/icon/person.2.fill.svg": "31d331f3ec044f5588c928cc3cf33f8e",
"assets/assets/icon/bell.svg": "a82f2c35d08f1fb8a5d50ab626c9f23c",
"assets/assets/icon/magnifyingglass.svg": "4e38c15172ea5ef1686506b052c45a4e",
"assets/assets/icon/hand.thumbsup.fill.svg": "dccab9ef02e6b64db738a5e531827093",
"assets/assets/icon/arrow.turn.up.left.svg": "b61a15ea62d3bb69650a283b2972cd3a",
"assets/assets/icon/rectangle.and.hand.point.up.left.filled.svg": "87861bafbb8fc5a8016940079f0efbaa",
"assets/assets/icon/chevron.backward.svg": "80a3ad8a02f386c50af309dd1d5da04c",
"assets/assets/icon/chevron.down.svg": "1804d3a32215400c01175ae7d404065b",
"assets/assets/icon/airpod.left.svg": "d5bedcd003bdbb711a587fac444808e5",
"assets/assets/icon/plus.svg": "4c7c1619c9b922ec00a635cb34b829fc",
"assets/assets/icon/seal.fill.svg": "034da1c2ea7c6f2b87a67efaec63aa78",
"assets/assets/icon/chevron.up.svg": "9569ccaf93d4954c7eb1f025e8fea077",
"assets/assets/icon/circle.fill.svg": "65db6663123f4321e5eba6f8591247b1",
"assets/assets/icon/person.2.svg": "391af4207b28bfa7b31077909c450ff8",
"assets/assets/icon/trash.fill.svg": "22cde78eaac6c4477fa6c4832507c945",
"assets/assets/icon/speaker.fill.svg": "63a71f2ddc9295241be63c5c8e7e00c6",
"assets/assets/icon/hand.thumbsdown.fill.svg": "96c675a51c44e1151b79de91e04cec62",
"assets/assets/icon/exclamationmark.circle.svg": "9af2209045bdce7e6b548e56066e3c2b",
"assets/assets/icon/location.pin.svg": "32cd99b36c9b8762025253c1f4ced43b",
"assets/assets/icon/suitcase.fill.svg": "ed86b7a4574560d0ba86fca3ad40e95e",
"assets/assets/icon/checkmark.shield.fill.svg": "62d9071511263360726342bb0082a124",
"assets/assets/icon/pause.fill.svg": "d83c7525eb706b1da3ea97aa4338990d",
"assets/assets/icon/logo.fill.svg": "a62c1b5ca467341a385513da2523005d",
"assets/assets/icon/bell.fill.svg": "9d148078e4f6793359c2d53552abacfb",
"assets/assets/icon/video.badge.plus.svg": "9721c5c8cda1f83b0f490c59966ed06d",
"assets/assets/icon/square.svg": "4e013e567c0a63a6963755afaae15642",
"assets/assets/icon/play.svg": "e15163375d40e4105c14628fc850f238",
"assets/assets/icon/arrow.up.arrow.down.svg": "b37906e0970db2cfb3b85280db6e47f4",
"assets/assets/icon/send.svg": "7ac1ed05f6892268512d4e7ff60fd3e4",
"assets/assets/icon/arrow.up.svg": "4b7e7819d38c874877aa189a77b6598f",
"assets/assets/icon/speaker.svg": "463b3b89b419efe81e6eb736f8121c59",
"assets/assets/icon/hand.draw.left.fill.svg": "fbba152cc740f038a2eb16f013dba31b",
"assets/assets/icon/play.fill.svg": "13c3bc4beb9b3d2f7244d5fc8062a3a0",
"assets/assets/icon/gearshape.fill.svg": "da33421afb0f6cb718f2c7263be3c16a",
"assets/assets/icon/xmark.svg": "8743d36c2c7da3211f7862c98f006179",
"assets/assets/icon/trash.svg": "8d0e0bb3e0e543fe38c952976595b17a",
"assets/assets/icon/arrow.triangle.2.circlepath.camera.fill.svg": "c3bff48b3249c55c255e2e07ae27a74c",
"assets/assets/icon/speaker.slash.fill.svg": "475a9370ad9802b628f8721b8e119444",
"assets/assets/icon/seal.svg": "dd5cf22c3d156cd997c266464d3c5d9e",
"assets/assets/icon/rectangle.and.hand.point.up.left.fill.svg": "2aa9173bf8893094c8b91c88a5af5eea",
"assets/assets/icon/video.fill.badge.plus.svg": "ca756747711f0cebd50ad1f3ceb51c2b",
"assets/assets/icon/bubble.left.svg": "1ed0dc0c938bf1854f1852db6d9de70e",
"assets/assets/icon/qr.jpg": "87f13fe9a0cedfb001e61b83671c436b",
"assets/assets/icon/pencil.svg": "080326d9e6a34d670196f6da592ed7a0",
"assets/assets/icon/qr.png": "172e69c03470cbae94869d1d5287b3bd",
"assets/assets/icon/moon.fill.svg": "562bc1031ff7c344c8446a415be0e25d",
"assets/assets/icon/phone.svg": "6a2d573c4457eb36e775ce629acd4c1e",
"assets/assets/icon/square.and.pencil.svg": "dd7192a76c1a805d95f1ebc22b9212da",
"assets/assets/icon/rows.svg": "0d37d8d05def61d68b87c0b366bc7a6d",
"assets/assets/icon/eye.svg": "cd8502275a55ae77af8d9efb540e8de4",
"assets/assets/icon/person.fill.svg": "2321cbe91eefe212e182f252c0d74b1f",
"assets/assets/icon/gearshape.svg": "03ad438fcbd8bb7e90025a3a4896f8e9",
"assets/assets/icon/heart.fill.svg": "8b229737b9ddd24a2c695dcce74e8174",
"assets/assets/icon/handshake.svg": "66875258b2d0c35c80ba68e8fa28003d",
"assets/assets/icon/calendar.svg": "dba1de3a23a45c358489ff602bf19748",
"assets/assets/icon/globe.svg": "c96e11b6324b549c9d5ee8bd89cb5993",
"assets/assets/icon/ellipsis.svg": "7fe3d25e0dd5d6c8cc445068fb7b2b28",
"assets/assets/icon/hand.draw.right.svg": "e6a9f1cef2f9e80cd5251672d75b7efe",
"assets/assets/icon/face.smiling.svg": "9f8f2e1a37cfc6fccb4730abd923ea1d",
"assets/assets/icon/face.smiling.fill.svg": "0f405f792996fa5a730f95ac71f0fcd2",
"assets/assets/icon/suitcase.svg": "9d7f5c93e9ce6a64b03bee995a7e348a",
"assets/assets/icon/logo.svg": "dc77c481cfe2c78a533fc22371e5f31f",
"assets/assets/icon/pause.svg": "80efe2be23ba3eab1f9e1ea623fdfea7",
"assets/assets/icon/arrow.triangle.2.circlepath.camera.svg": "2e1d83ca7999f06939ec7ea904d37e7c",
"assets/assets/icon/hand.draw.right.fill.svg": "1989ecac53b45a1a91bbd8776ae019a3",
"assets/assets/icon/icon_app.jpg": "794a59d21006a47412d655de320694a3",
"assets/assets/icon/square.and.arrow.up.svg": "c67939885fcdac675196b18b860c72c3",
"assets/assets/icon/chevron.forward.svg": "fe21b8f0bbab8a86f5569d8daa27cf66",
"assets/assets/icon/hand.draw.left.svg": "04fcc2cf1408f1c3496312a5f5dac562",
"assets/assets/icon/play.rectangle.on.rectangle.fill.svg": "69b755eaf73811406d2cd3316420b458",
"assets/assets/icon/handshake.fill.svg": "eaa12707dd8e72dec136f19e3f90f2bb",
"assets/assets/icon/moon.svg": "081c5066e8b900da5483b19d7af256e9",
"assets/assets/icon/phone.fill.svg": "504ecfc339238fa11285a33bd9e19e40",
"assets/assets/icon/person.crop.rectangle.fill.svg": "0c2f28748946b0d2ef13e15b33089570",
"assets/assets/icon/heart.svg": "db1462bc97a92414dcfedbb9948eb264",
"assets/assets/onboarding/container5.svg": "ee532ffc56b26c139fc3714f3c1e7534",
"assets/assets/onboarding/container4.svg": "1015874f4c28ab8696779697901debe9",
"assets/assets/onboarding/container6.svg": "002fe929ff2f19a3b3546b0db6cb5745",
"assets/assets/onboarding/container3.svg": "841d396bf8de29825da332d9ece3667f",
"assets/assets/onboarding/container2.svg": "17b20324c7364aac858d5bf091bc836d",
"assets/assets/onboarding/container1.svg": "69d9727802461280e934951de3400999",
"assets/assets/guest_images/response.svg": "52eb9d6e847515f2792c9822f6a5cf19",
"assets/assets/guest_images/messages.svg": "cea0176e3907df36f75682376412e569",
"assets/assets/guest_images/favorites.svg": "71a1d93a5bbd991e86eea1a06abc9411",
"assets/assets/guest_images/lk.svg": "93bd5983ddee325616288e5dbaf394cc",
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
