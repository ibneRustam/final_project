'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "1f021b9c1d96ab80edf62344d690ddfd",
"assets/AssetManifest.bin.json": "3c30af52f3407b884d3d6ce62f4124a3",
"assets/AssetManifest.json": "cb53aa0eebac21ec588b7ce923af64e9",
"assets/assets/image/acc1.jpg": "d954bfee745c20917f5f9d3d7fddda0d",
"assets/assets/image/acc2.jpg": "471e3d57098d3e15ec7e4b221a8735fb",
"assets/assets/image/acc3.jpg": "f6bc7d86dd7693cfe40e7202158b27f2",
"assets/assets/image/acc4.jpg": "4f731dfedf4f8b0b97789cd55da91c9b",
"assets/assets/image/acc5.jpg": "6cb38f485f1a2c0aa8793eb4805faad1",
"assets/assets/image/acc6.jpg": "52cd61881cb725112d05e2be4faaedd7",
"assets/assets/image/acc7.jpg": "952a6e488380e8364f4c714e37aed21a",
"assets/assets/image/acc8.jpg": "8fcab6da3c70a21b31451fb82ac7dea2",
"assets/assets/image/airbird1.webp": "b09265614fb78e3135743507ed118f1f",
"assets/assets/image/airbird10.webp": "9dfc0c7d39b9fd7c9ad5a5da87e29a74",
"assets/assets/image/airbird2.webp": "5be2b50b26a6063c1f75946da9ccb1ae",
"assets/assets/image/airbird3.webp": "877d1e387ad3e727cbc5c3d3246650bb",
"assets/assets/image/airbird4.webp": "ec39e301991a28a82c8f3621fd40e932",
"assets/assets/image/airbird5.webp": "751645b5905ce7ba4b77551ef207967b",
"assets/assets/image/airbird6.webp": "ab7d508f962e0076b201687134f33c0e",
"assets/assets/image/airbird7.webp": "d91d701c41b64f11fab978823c646e65",
"assets/assets/image/airbird8.webp": "4559dfed4bb05fffbcbdff382dfa885c",
"assets/assets/image/airbird9.webp": "bd44f1ec67d3d90fe1ac20626e62cabe",
"assets/assets/image/airbuds.jpg": "3647409559a85199966d1db65f99c49d",
"assets/assets/image/cam1.jpg": "3e7d08714bb59891df238a3aa652cfba",
"assets/assets/image/cam2.jpg": "7753765aa4b7cbcb7f6d964e35110e8a",
"assets/assets/image/cam3.jpg": "e204b119f42d9c5d55ff17b7295d3b73",
"assets/assets/image/cam4.jpg": "a4db523817e97d77a60ef14b99c94163",
"assets/assets/image/cam5.jpg": "191e1135c6ab7ca6616c13abcb7850d7",
"assets/assets/image/camera.jpg": "9cea5b0ec64eb7ebbb38a3b5c5fa77c9",
"assets/assets/image/charger.jpg": "e18454492976973446aae8fe81248757",
"assets/assets/image/console.jpg": "0c40ad4cd1c2cab600f5ec46a2b31079",
"assets/assets/image/download.jpg": "f2ba9435c0ccf51e78a12c7474d57d80",
"assets/assets/image/earphone.jpg": "2611ad7690fc28a9f2ef6d024027caf1",
"assets/assets/image/home1.jpg": "63a83d2d147edfad6bcc1fa274484a67",
"assets/assets/image/home2.jpg": "b3286862c302a30d013ad038ed416689",
"assets/assets/image/home3.jpg": "e7a6ef0d5412b2596576b11994a0184c",
"assets/assets/image/home4.jpg": "2dc5957e7a3d24d9aa44509caa5daa42",
"assets/assets/image/lap1.jpg": "25dadc86e3f039010016464be7857bde",
"assets/assets/image/lap2.jpg": "a04c70da3e02138be31714d97c428f9a",
"assets/assets/image/lap3.jpg": "cd5d8a548eb8f3cb2ad0d405e46cfb1f",
"assets/assets/image/laptop.jpg": "77e0c412e805e74f617d3726f10b5fc7",
"assets/assets/image/laptops.jpg": "ac0cdb64477d83b23de2148df873bf7b",
"assets/assets/image/mbl1.webp": "18b22edcf4fad613b537302cfa627585",
"assets/assets/image/mbl10.webp": "0f4cdf093a9a15af4b90c032d62fc81b",
"assets/assets/image/mbl11.webp": "8158ca02ff1e2b2e19a86640d6aea9a1",
"assets/assets/image/mbl12.webp": "7732b55e54a8d321f2c2b8ab9a37cca1",
"assets/assets/image/mbl13.webp": "fe2c6e2a4e30f28da5706e130802adc7",
"assets/assets/image/mbl14.webp": "6b511634960c95eda4be2c3b3ff7a5c6",
"assets/assets/image/mbl15.webp": "9d21a4544894363f6c40c9f81b4c8e86",
"assets/assets/image/mbl2.webp": "489ace8d6dca3cfbbc3fbe6529c701d5",
"assets/assets/image/mbl3.webp": "0e61a84c1cc3ba2e896f10ca4fa30445",
"assets/assets/image/mbl4.webp": "a4cc996a5c57705baa0c6dd8b3a2537d",
"assets/assets/image/mbl5.webp": "88946d5902cf1a5d5c07895ea8dee596",
"assets/assets/image/mbl6.webp": "e92c4e2758bbc2dd274dd4b5f6e81eed",
"assets/assets/image/mbl7.webp": "387c25fefd0c669d38e9fc117d33f0ca",
"assets/assets/image/mbl8.webp": "620a990e96c7d00548cde0ecf5a62b6c",
"assets/assets/image/mbl9.webp": "1f93d89ac52626a0cdcd127dcf087078",
"assets/assets/image/mobile.jpg": "4f2bc81e7507554ce8eb3b6446596913",
"assets/assets/image/mobileee.webp": "4df08f46dcec0045ed8756acd59abf77",
"assets/assets/image/mobilese.webp": "7978663788112c6ac5ddc061f35739de",
"assets/assets/image/OEM%2520Samsung%2520Galaxy%2520S8%2520S9%2520S10%2520Plus%2520Huawei%2520Mate%252030%25E2%2580%25A6.jpg": "d9a2eabccf7ae5f1cc250858691321c2",
"assets/assets/image/Portable%2520Charger%252032000mAh,%252022_5W%2520&%2520PD18W%2520USB%2520C%25E2%2580%25A6.jpg": "c0948b196034f9dc43a76da600a1073e",
"assets/assets/image/powerbank.jpg": "f22e0386e6cdee4742706f4701ad7827",
"assets/assets/image/Samsung%2520-%2520Series%25207%2520Slate%2520Tablet%2520with%252064GB%2520Memory%25E2%2580%25A6.jpg": "e7cacb1d6d478887b2f118a1eb500440",
"assets/assets/image/samsung-galaxy-s25-ultra-12gb-1tb-pakistan-priceoye-kxd97-500x500.webp": "dd3f155ecf233c216b982237acae072f",
"assets/assets/image/smartwatch.jpg": "5253d1bb6361da70984507abf7b83f29",
"assets/assets/image/tab1.jpg": "dd72a21415867912697b387e2b310d03",
"assets/assets/image/tab2.jpg": "e3cbb3a9f12a6cdcde6e767877d98f12",
"assets/assets/image/tab3.jpg": "bf022c632a3c8b0fb887ba6a90cb18d4",
"assets/assets/image/tab4.jpg": "dc0a730ab6bd270fcee063e5a710103e",
"assets/assets/image/tab5.jpg": "44da9baf92119b717384e08c851a8381",
"assets/assets/image/tab6.jpg": "91c4bb0f574ed1140ced67c6d36b5e48",
"assets/assets/image/tab7.jpg": "5aed3f2caeae4287178aab99ec000496",
"assets/assets/image/tab8.jpg": "c6316cea1e77c494d97cbec8e08d081d",
"assets/assets/image/tablet.jpg": "2b8fa4b7257f5044c6baa0bb3d69e27b",
"assets/assets/image/watch1.webp": "4d67fbc2699ed5b065a1e5e6a4728fad",
"assets/assets/image/watch10.webp": "8a266db92242105b43555bf93acbab99",
"assets/assets/image/watch11.webp": "fd29d61b87bda790c8d4141dcc1443a4",
"assets/assets/image/watch12.webp": "b5ca3d12bbc642be8b035b4b758e3be0",
"assets/assets/image/watch13.webp": "11c67462a77d32ed8a662f5dab115bd8",
"assets/assets/image/watch14.webp": "c9403237a59a7e3b4d49166ceec21f56",
"assets/assets/image/watch15.webp": "5237086b8729d5b4b8f503987e9d5be7",
"assets/assets/image/watch2.webp": "ba88e5d1ee56ee8718427b2e169118a4",
"assets/assets/image/watch3.webp": "6978bdce4f08020912533252e80804ee",
"assets/assets/image/watch4.webp": "cd0861cb4eaf3d24a27556ee1b6316d1",
"assets/assets/image/watch5.webp": "dbf0f9e9ea42c646c8bb9a2c759f9e28",
"assets/assets/image/watch6.webp": "9928196872cd0b6bd416c32bee2448d6",
"assets/assets/image/watch7.webp": "36a3cbb437380adc29f1dfc3e57884ad",
"assets/assets/image/watch8.webp": "8fe6ff1c4a057c6e553cea4973a7f5d1",
"assets/assets/image/watch9.webp": "31878fe78dfb1baf68a4988169f2814b",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "13bc6f78e87cad9872ddd34e83d5faff",
"assets/NOTICES": "61142342308420c358aac2fdd1cdfcbd",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "31eae51dc9e4ae8dc504e957a46a8e77",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "ecd8403d0a022aaecdbbf037779571d3",
"/": "ecd8403d0a022aaecdbbf037779571d3",
"main.dart.js": "9ab09bc37a3a13f055124d604824a946",
"manifest.json": "337fbd5671357c8c166d74e98a8397da",
"version.json": "882561a23e46efb349f16f4735e1e14a"};
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
