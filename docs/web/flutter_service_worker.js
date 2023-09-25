'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {
  "version.json": "9b818ca9511483c901bed1545384376c",
  "index.html": "043f921128e63604b8577bc514017b4a",
  "/": "043f921128e63604b8577bc514017b4a",
  "main.dart.js": "fa3f940b8823c563326ae976df01598a",
  "flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
  "favicon.png": "689a7e0b764ef9279b597b7e563be10e",
  "manifest.json": "e2b9103aaafaf8ed9f90576c9d9a1341",
  "assets/AssetManifest.json": "bfb53980e00a8871cd9f54d7dbe174a4",
  "assets/NOTICES": "21c37d2dcfe31a240936390d203adfc3",
  "assets/FontManifest.json": "afe2e2bd06e32d617d654e0db1bc26b5",
  "assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
  "assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
  "assets/AssetManifest.bin": "c4f6cc3a2a8bcf0ad8c86e66337bec49",
  "assets/fonts/MaterialIcons-Regular.otf": "6234bdbf169ef62bb6a80f996b7d289d",
  "assets/assets/images/github.png": "43ce87609eb221d09d4832a9c0e709d0",
  "assets/assets/images/profile.png": "758e0056a605c5681426616e27d6f07d",
  "assets/assets/images/zenn.png": "23a23dc9d8df385e2b4eb50d57e1fc07",
  "assets/assets/images/qiita.png": "572179a3bbde375850422ea48b2b6272",
  "assets/assets/fonts/Noto_Sans_JP/static/NotoSansJP-Bold.ttf": "4aec04fd98881db5fbc79075428727ef",
  "assets/assets/fonts/Noto_Sans_JP/static/NotoSansJP-Thin.ttf": "2361e7d2fb980b4fbf696ccdf4dcd1b1",
  "assets/assets/fonts/Noto_Sans_JP/static/NotoSansJP-ExtraBold.ttf": "bbb303ee75d437b96eaa696d283d9348",
  "assets/assets/fonts/Noto_Sans_JP/static/NotoSansJP-Medium.ttf": "818eefff2fa0b989124d9ba3a84f073c",
  "assets/assets/fonts/Noto_Sans_JP/static/NotoSansJP-Regular.ttf": "022f32abf24d5534496095e04aa739b3",
  "assets/assets/fonts/Noto_Sans_JP/static/NotoSansJP-Light.ttf": "7d1e0e68062ba3ae1cc12009620f645d",
  "assets/assets/fonts/Noto_Sans_JP/static/NotoSansJP-Black.ttf": "0938466177f003e69b3c2282ced133f9",
  "assets/assets/fonts/Noto_Sans_JP/static/NotoSansJP-SemiBold.ttf": "2f9b41d9040065bcce6ad91656732829",
  "assets/assets/fonts/Noto_Sans_JP/static/NotoSansJP-ExtraLight.ttf": "1bf5589e8c81cbc667f6db24e2c72846",
  "canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
  "canvaskit/skwasm.wasm": "d1fde2560be92c0b07ad9cf9acb10d05",
  "canvaskit/chromium/canvaskit.js": "ffb2bb6484d5689d91f393b60664d530",
  "canvaskit/chromium/canvaskit.wasm": "393ec8fb05d94036734f8104fa550a67",
  "canvaskit/canvaskit.js": "5caccb235fad20e9b72ea6da5a0094e6",
  "canvaskit/canvaskit.wasm": "d9f69e0f428f695dc3d66b3a83a4aa8e",
  "canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15"
};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
  "index.html",
  "assets/AssetManifest.json",
  "assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, { 'cache': 'reload' })));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function (event) {
  return event.waitUntil(async function () {
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
    .then((cache) => {
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
