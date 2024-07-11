'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "1f60e8a64deb05c382cd517954c79b46",
"assets/AssetManifest.bin.json": "b9d96e2b29b271b6571be52b7d2d4148",
"assets/AssetManifest.json": "8e46ea666b4b7869b40d479544b5a7ae",
"assets/assets/Backgrounds/Spline.png": "ff232f0cf3ebd732ca4383c381450714",
"assets/assets/excel/nuevo1.xlsx": "38de6346f3421d3cacfc3b960ceb1b00",
"assets/assets/girl1.jpg": "1a7971a723f5213c1eea59cc2d772158",
"assets/assets/girl2.jpg": "582f000161038f7ac1305b5ae432faaa",
"assets/assets/icons/apple_box.svg": "3f634f4f80414d88ada3193069b4f961",
"assets/assets/icons/Arrow%2520Right.svg": "82b7f5520958b35402d7576d20fb5186",
"assets/assets/icons/code.svg": "516c08c5e685a49b79fa87d0cc2f7641",
"assets/assets/icons/email.svg": "1ae885eb1fdb247400ac0400112ddefb",
"assets/assets/icons/email_box.svg": "a09e0cb77621a100cfe8c98593b9f422",
"assets/assets/icons/google_box.svg": "9f643ad1c6e2731879c4eb501357d784",
"assets/assets/icons/ios.svg": "45b815957b353fc2c4b56e2e3779d6f3",
"assets/assets/icons/password.svg": "64a726ac604a3e6228987eeb9c10bc71",
"assets/assets/icons/profile_img.png": "bdd25e977a6858b7413f720188f721c3",
"assets/assets/icons/User.svg": "5eb1b43b454f1e763da0928d4841c138",
"assets/assets/images/bandera.png": "c215964ae1a67062a9222fabdd6f51b5",
"assets/assets/images/logo.png": "b7e3c6bee4e6bf8a9a9aa8ea8aa162b0",
"assets/assets/logo.jpeg": "0c23c3de6481bcd61459b746e75e1841",
"assets/assets/lottie/constructors.json": "f21dda62cd423a92b3de2644ac67d4a7",
"assets/assets/lottie/consult_girl.json": "28071c3bb97311e3bd8221ff22e2f64a",
"assets/assets/lottie/first_girl.json": "bd8db3d4034aedc41ffd757986f5f15d",
"assets/assets/lottie/medals.json": "819daa771c0097831caf9a3676c329db",
"assets/assets/lottie/search_files.json": "a0f3d167d544e4226b23929a736ef051",
"assets/assets/onbording_imgs/certificado.png": "b09fb1c8ff4a1b807b813c3c54ac0b49",
"assets/assets/onbording_imgs/confiar.png": "1911b9a24a9c5d4da82968cf62067f75",
"assets/assets/onbording_imgs/exito.png": "37a5a4ed601d70aa8e0bf26cbf75e9f3",
"assets/assets/onbording_imgs/ganar.png": "71298ab920da231d63e1e07a364689f7",
"assets/assets/onbording_imgs/lista.png": "a670fd2a47354ef21d1aecc77e7e29dc",
"assets/assets/onbording_imgs/tutorial.png": "d1a751fff34b0602b5ed802efe125a0c",
"assets/assets/paises.json": "965b60b399314a91e26020096d90fb24",
"assets/assets/rive/cat.riv": "424a492780e06e4e47af49abcc0da820",
"assets/assets/rive/catv1.riv": "162f0beff720c419adfea458d94e8dd3",
"assets/assets/RiveAssets/animated_checkbox.riv": "f0c5ec3e2378a4faffef218368daa2d9",
"assets/assets/RiveAssets/button.riv": "c8ffe2900d31d8236247928cd7c2b5f3",
"assets/assets/RiveAssets/check.riv": "14f9269423eabd7e2e10cafdc6ad4d41",
"assets/assets/RiveAssets/checkmark.riv": "f727511181073dbc1589cf668f3182b1",
"assets/assets/RiveAssets/confetti.riv": "ad0d13cbea799085305316f0e8118274",
"assets/assets/RiveAssets/GIRL.riv": "7ba644f91a96b617d9a0a539175f5362",
"assets/assets/RiveAssets/house.riv": "3ac77437a4c56b5143d6ceca83dd61d9",
"assets/assets/RiveAssets/icons.riv": "3d29f9acebef13f01f371b59e84e664b",
"assets/assets/RiveAssets/menu_button.riv": "f8fdfd9fd8dc7873dfac6f005f3233c1",
"assets/assets/RiveAssets/shapes.riv": "8839d67714d5e9c52b3e0dbb2b1e89c1",
"assets/assets/w_logo.png": "72be19af7c4370dd9448a13bcfd0f559",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "ac6138044e1f261836468783d7597cd9",
"assets/NOTICES": "7fcfa384d6c8b058b445cc9650fd00a3",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "03f346c52ae6f11b3ee0988b4c0b243e",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "39445f2efb02ea5321d57f66a7bbd431",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"flutter_bootstrap.js": "136dea6040af9ef62793e5f95921e5e3",
"icons/Icon-192.png": "ba5c7bf33d39ba8b06bd3ea58742b8f9",
"icons/Icon-512.png": "ff98b76505806f6588704d8cda1db4e7",
"icons/Icon-maskable-192.png": "ba5c7bf33d39ba8b06bd3ea58742b8f9",
"icons/Icon-maskable-512.png": "ff98b76505806f6588704d8cda1db4e7",
"index.html": "9c912d491063bd3626fbc2136abc7f48",
"/": "9c912d491063bd3626fbc2136abc7f48",
"main.dart.js": "a671d5636365bb9253301bce5bb5cf6f",
"manifest.json": "a8f8ee2a167295dd2e73b8346fcd7051",
"splash/img/dark-1x.png": "c565d1c5f81744a5c798f1c1e9117979",
"splash/img/dark-2x.png": "ff98b76505806f6588704d8cda1db4e7",
"splash/img/dark-3x.png": "229da72d394d1b666439d0865a8e5dd6",
"splash/img/dark-4x.png": "333df7cc49e8a07080b6c7ebaf1c673f",
"splash/img/light-1x.png": "c565d1c5f81744a5c798f1c1e9117979",
"splash/img/light-2x.png": "ff98b76505806f6588704d8cda1db4e7",
"splash/img/light-3x.png": "229da72d394d1b666439d0865a8e5dd6",
"splash/img/light-4x.png": "333df7cc49e8a07080b6c7ebaf1c673f",
"version.json": "d62d4b8876a557cf85a05edc75152df1"};
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
