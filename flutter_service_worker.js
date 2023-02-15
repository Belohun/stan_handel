'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"index.html": "905aea08f1289487c767546163ad82d9",
"/": "905aea08f1289487c767546163ad82d9",
"main.dart.js": "8710c24b1682e8f9b222f18cff8e95f4",
"manifest.json": "b4fa884fa80320f741d1011a41fcd7de",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"assets/FontManifest.json": "22241d578b9e5a5012b5362681a30a2f",
"assets/NOTICES": "b7a3c1e0a9179472d7b0e58684063d3d",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/shaders/ink_sparkle.frag": "0cfae77e432d12ec44627f8d9eacbc65",
"assets/assets/images/question_mark.png": "06171ea824b19919c57870f654ee12a2",
"assets/assets/images/production.png": "bf111ff8ec67dc92d519cc79095f17d8",
"assets/assets/images/checker_plate_metal_sheet.png": "b2f873a7a78ceb5f42041eb842d6a9f4",
"assets/assets/images/steel_pipes.png": "78c7a9dc926049077c1bb1adeda8d8b2",
"assets/assets/images/shake_hands.png": "5a4e3444c3530cbcc48384f74e69ad63",
"assets/assets/images/quality.png": "02b9ec6c11da1e190bda62ecc01840d5",
"assets/assets/images/steel_sheets_small.webp": "d7d8cfb1ece30e9e409b0403fe6dcd1e",
"assets/assets/images/production_alternative.png": "1f7818fd53364925f0b149b63060eea7",
"assets/assets/images/phone.png": "8dc76ef450c5bb06950f7a8ec729a00b",
"assets/assets/images/closed_profile.png": "84ef6ab2ed8e6ac6540c49020a189c90",
"assets/assets/images/metal_sheets.png": "058970bd3faf7fda06a5ec2c721b64e7",
"assets/assets/images/galvanized_metal_sheet.png": "6b495cbfc9c6213dbb1c74bc5a5ab7de",
"assets/assets/images/logo_small.png": "7f6a46efbfd293a6518d382c9a5db932",
"assets/assets/images/cold_rolled_metal_sheet.png": "ae1e2a53241651144e746da167df1db1",
"assets/assets/images/pipes.jpeg": "14a264ee79316a2a663c1df129a81131",
"assets/assets/images/steel_sheets.jpg": "bb510134a7b1d508a323d2225510b243",
"assets/assets/images/seamless_pipes.png": "450429b37e0c32c860a10b36185bddcb",
"assets/assets/images/metal_sheet_production.png": "a79d96d41a52885087afa2f334ee3d63",
"assets/assets/images/steel_sheets_stack.jpg": "05bed7521dbfb575d4e5ffcf034484ec",
"assets/assets/images/localization.png": "66451d3721ec1ae9da5f972c87335a58",
"assets/assets/images/seamed_pipe.png": "876ec90205074d323b663a5625acdf05",
"assets/assets/images/contact.jpg": "8d3c93d160d44d23aa0bcf887d583ac8",
"assets/assets/images/angle_bar.png": "f985a220ce50b2d38989eae7195a8837",
"assets/assets/images/usage.png": "eee0bad04af243a493d7dfc25c89191a",
"assets/assets/google_fonts/Inter-Regular.ttf": "515cae74eee4925d56e6ac70c25fc0f6",
"assets/assets/google_fonts/Inter-ExtraLight.ttf": "909744bbb5a7ede41ce522a1507e952c",
"assets/assets/google_fonts/Inter-Medium.ttf": "5ff1f2a9a78730d7d0c309320ff3c9c7",
"assets/assets/google_fonts/Inter-Black.ttf": "5f2ce7df2a2e8570f4c32a44414df347",
"assets/assets/google_fonts/Inter-SemiBold.ttf": "ec60b23f3405050f546f4765a9e90fec",
"assets/assets/google_fonts/Inter-Thin.ttf": "35b7cf4cc47ac526b745c7c29d885f60",
"assets/assets/google_fonts/Inter-ExtraBold.ttf": "bd9525f1099e9f5845f6aef2956e9fb8",
"assets/assets/google_fonts/Inter-Bold.ttf": "91e5aee8f44952c0c14475c910c89bb8",
"assets/assets/google_fonts/Inter-Light.ttf": "6ffbefc66468b90d7af1cbe1e9f13430",
"assets/assets/svg/poland_flag.svg": "47bd4a5e5f5743c88f3eb82c9e382c06",
"assets/assets/svg/uk_flag.svg": "8bc4c3e7f2725a0250719069c601adaa",
"assets/assets/translations/pl.json": "47858bb5e7bebef0235dfe18dc2c380d",
"assets/assets/translations/en.json": "e8cb12f9b7b58c828d3576b458f58eae",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/easy_localization/i18n/en-US.json": "5f5fda8715e8bf5116f77f469c5cf493",
"assets/packages/easy_localization/i18n/ar-DZ.json": "acc0a8eebb2fcee312764600f7cc41ec",
"assets/packages/easy_localization/i18n/en.json": "5f5fda8715e8bf5116f77f469c5cf493",
"assets/packages/easy_localization/i18n/ar.json": "acc0a8eebb2fcee312764600f7cc41ec",
"assets/AssetManifest.json": "fa980ca33430feb0217b8a0d7152196f",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"version.json": "fda67098ff122b34b3504ea96ba62350"
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
