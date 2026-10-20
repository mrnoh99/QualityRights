/* Service worker for the 인권중심 중재기술 web app.
   Precaches the app shell and assets so it works fully offline after the first
   visit. Dynamic files (HTML/JS/manifest) use network-first so content stays
   fresh when online; static files (images/icons/fonts) use
   stale-while-revalidate for instant load and background updates.
   Note: service workers run on https (GitHub Pages), not inside the Artifact
   sandbox — registration there simply no-ops. */
var VERSION = "qr-cache-v1";

var CORE = [
  "./",
  "index.html",
  "content.js",
  "figures.js",
  "manifest.webmanifest",
  "assets/icon-180.png",
  "assets/icon-192.png",
  "assets/icon-512.png",
  "assets/icon-maskable-512.png",
  "assets/figures/od-network.png",
  "assets/figures/od-interventions.png",
  "assets/figures/dotp-flow.png",
  "assets/figures/stab-escalation.png",
  "assets/figures/stab-stages.png",
  "assets/figures/recovery-star.png",
  "assets/figures/sdm-transition.png"
];

self.addEventListener("install", function (e) {
  e.waitUntil(
    caches.open(VERSION).then(function (c) {
      return c.addAll(CORE);
    }).then(function () { return self.skipWaiting(); })
  );
});

self.addEventListener("activate", function (e) {
  e.waitUntil(
    caches.keys().then(function (keys) {
      return Promise.all(keys.map(function (k) {
        if (k !== VERSION) { return caches.delete(k); }
      }));
    }).then(function () { return self.clients.claim(); })
  );
});

self.addEventListener("fetch", function (e) {
  var req = e.request;
  if (req.method !== "GET") { return; }
  var url = new URL(req.url);
  var sameOrigin = url.origin === self.location.origin;
  var dynamic = req.mode === "navigate" ||
    (sameOrigin && (url.pathname.endsWith(".js") || url.pathname.endsWith(".webmanifest")));

  if (dynamic) {
    // network-first, fall back to cache (and to index.html for navigations)
    e.respondWith(
      fetch(req).then(function (res) {
        var copy = res.clone();
        caches.open(VERSION).then(function (c) { c.put(req, copy); });
        return res;
      }).catch(function () {
        return caches.match(req).then(function (m) {
          if (m) { return m; }
          if (req.mode === "navigate") {
            return caches.match("index.html").then(function (x) { return x || caches.match("./"); });
          }
          return undefined;
        });
      })
    );
  } else {
    // stale-while-revalidate for static assets (images, icons, fonts)
    e.respondWith(
      caches.match(req).then(function (cached) {
        var network = fetch(req).then(function (res) {
          if (res && (res.status === 200 || res.type === "opaque")) {
            var copy = res.clone();
            caches.open(VERSION).then(function (c) { c.put(req, copy); });
          }
          return res;
        }).catch(function () { return cached; });
        return cached || network;
      })
    );
  }
});
