'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "b2ffcea57a817ff0cd5146b569ab9ff5",
"assets/assets/fonts/Raleway/Raleway-Bold.ttf": "7802d8b27fcb19893ce6b38c0789268e",
"assets/assets/fonts/Raleway/Raleway-Medium.ttf": "2ec8557460d3a2cd7340b16ac84fce32",
"assets/assets/fonts/Raleway/Raleway-Regular.ttf": "75b4247fdd3b97d0e3b8e07b115673c2",
"assets/assets/fonts/Raleway/Raleway-SemiBold.ttf": "8a192102b50118c45033e53ce897f103",
"assets/assets/icons/behance-alt.svg": "5c5cb1c76f9e70c3906f061365fdac19",
"assets/assets/icons/feather_dribbble.svg": "89b806ce6cc9dea635b81d7dc2406352",
"assets/assets/icons/feather_message-square.svg": "5194a360f12626cb541cc80f58c4f217",
"assets/assets/icons/feather_search.svg": "9d58d567fd606a3fdf19583f8685523d",
"assets/assets/icons/feather_share-2.svg": "2eadf3eff1fb945866235c94ec30915d",
"assets/assets/icons/feather_thumbs-up.svg": "a066c16fa33209a18b5282c40da1cf78",
"assets/assets/icons/feather_twitter.svg": "3a254ce88e725b0169c202752364535e",
"assets/assets/icons/logo.svg": "c9931bc4e93cda3b203dae019b85688e",
"assets/assets/images/1.png": "f9b6b1c3583567ce918562d1577bb6fe",
"assets/assets/images/2.png": "8c7e4bd19becdcf620167e8a62b19297",
"assets/assets/images/3.png": "bad06f7ed9cb554a5e2ac312889dfd95",
"assets/assets/images/4.png": "5a0b5f70376f6f5d34cf32114617415c",
"assets/assets/images/5.png": "89efd1adb59f793b919f9cf9d10ef9ed",
"assets/assets/images/6.png": "03e23467f66e452926ae49cf9d6894ee",
"assets/assets/images/background11.jpg": "831e029df8ec9fd2345a7fe8746d54fa",
"assets/assets/images/Carouselbg.png": "1fa46bc92c209e73b61020124abaae43",
"assets/assets/images/favicon.png": "369628e67b7062a530fa6e322670d291",
"assets/assets/images/Home_pic.png": "6af40a0e61938ef6dfbfdd264f627591",
"assets/assets/images/loginpic2.png": "4914dc3f628283f7f891f455c95c4604",
"assets/assets/images/loginpic3.png": "2385b3d44ebe0a26d395745d76be058c",
"assets/assets/images/loginpic4.png": "e3797f43fe17ba3898d607d31b0103fe",
"assets/assets/images/logoagain.png": "4c7298c09622e92763992a66b3fedfdd",
"assets/assets/images/pharmacist2.jpg": "eb0dbe8c73851ba92ba4de7134363eab",
"assets/assets/images/pharmacisttt.jpg": "ab61c4aeeee46d84cd1d3f0e74a380e7",
"assets/assets/images/pharmacy_marker.png": "c1e482e38b070f89f03b49ccca2cf9fb",
"assets/assets/images/pic.png": "92784ed27aa40eff81a1e4709546ca9e",
"assets/assets/video_page.gif": "a870f6fb4f97af1b631d0e3fa5713611",
"assets/FontManifest.json": "bf62cde7a3fa16514d18c3043623faf9",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/images/1.jpg": "6acb2e9cdc06d6f3f31e6c1be94bb96a",
"assets/images/1m.jpg": "02c844fdbd751f8efb86d5906993040d",
"assets/images/1w.jpg": "f72f751733d965ca9fed0a144831a36d",
"assets/images/2.jpg": "e22bfdec0b05ad0943c68d3b4710462d",
"assets/images/2m.jpg": "9fb64bdc636a4390ba0a016054b4b225",
"assets/images/2w.jpg": "351b7b32e4820ad11153a9c109844394",
"assets/images/3.jpg": "63d95e83398432a3879c5d39614b8cf8",
"assets/images/3m.jpg": "c48cef9a82904dd36c8470c0289e3da4",
"assets/images/3w.jpg": "28ec7deb6b7540a19460fd3756a7a6cf",
"assets/images/4m.jpg": "5044292982d49d8a0dde51dce5dbb038",
"assets/images/4w.jpg": "4d48cf4c6ee2cfc1ec9c98a651b651ae",
"assets/images/5w.jpg": "3f63e59a37e8009633ba38f83caec073",
"assets/images/Asset%25205.png": "82b6034c1158aa500304bec9bce341e8",
"assets/images/Asset%25206.png": "7f95549f013fba5a9405de2b71d7a291",
"assets/images/Asset3.png": "bf382878f87040f77f83ab5918e7931f",
"assets/images/Asset4.png": "7fb8465819d55717b1698f5c2aba663b",
"assets/images/asset7.png": "82b6034c1158aa500304bec9bce341e8",
"assets/images/favicon.png": "369628e67b7062a530fa6e322670d291",
"assets/images/font_logo.png": "f52b04db2d592c96eea0064e5d069f96",
"assets/images/insta_logo.png": "b6202fffe96c1a2d24d50ffb5f0c99b5",
"assets/images/medicine.png": "794d8f875a1fa83ea5bb8336dcc5ffc2",
"assets/images/profile.jpg": "9fc5afab45b40534883ff6ed78e15074",
"assets/NOTICES": "b5643e8c44cfa6e0fc6f7729f9abba62",
"assets/packages/country_state_city_picker/lib/assets/country.json": "11b8187fd184a2d648d6b5be8c5e9908",
"assets/packages/csc_picker/lib/assets/country.json": "11b8187fd184a2d648d6b5be8c5e9908",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "85cf0c766fcd0f4ed87f28b8fe8639c3",
"/": "85cf0c766fcd0f4ed87f28b8fe8639c3",
"main.dart.js": "7697f8db048be4915528e2301f024447",
"manifest.json": "a5cd325049eaa0efc364047eba6aa499",
"version.json": "2eeffefa494a136b8995aa932092b83c"
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
