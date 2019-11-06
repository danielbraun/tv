(ns tv.core
  (:require [hiccup core page]))

(defn chan12-1 []
  (->>
   (clojure.java.shell/sh
    "curl"
    "https://keshethlslive-i.akamaihd.net/hls/live/512033/CH2LIVE_HIGH/index_850.m3u8"
    "-H" "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36"
    "-H" "Cookie: hdntl=exp=1573124609~acl=%2f*~data=hdntl~hmac=6526e71751c16869a77cf208659e506d2d870d7010a386af8bfdacdf492b1ec7;")
   :out))

(defn chan12-2 []
  (clojure.java.shell/sh
   "curl"
   "https://keshethlslive-lh.akamaihd.net/i/ch12ios_1@41375/index_1400_av-p.m3u8?sd=10&rebase=on&hdntl=exp=1573125436~acl=%2f*~data=hdntl~hmac=dabb161cbad1eb51b079b60d8d57219de447749c094bfa9926136c7747683c8d"
   "-H" "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.2 Safari/605.1.15"))

(defn chan13 []
  (->>
   (clojure.java.shell/sh
    "curl"
    "https://besttv1.aoslive.it.best-tv.com/reshetDVR01/testdvr/index_3.m3u8"
    "-H" "Referer: https://13tv.co.il/live/")
   :out))

(def urls
  ["https://kanlivep2event-i.akamaihd.net/hls/live/747610/747610/master.m3u8"
   "https://kanlivep2event-i.akamaihd.net/hls/live/747600/747600/master.m3u8"
   "https://w1.013.gostreaming.tv/Knesset/myStream/playlist.m3u8"
   "https://sport5-lh.akamaihd.net/i/radiolivev_0@698733/master.m3u8"
   "https://dvr.ch20-cdnwiz.com/mobilehls/dvr.m3u8"
   "https://besttv1.aoslive.it.best-tv.com/reshetDVR01/testdvr/index_3.m3u8"
   "https://nana10-hdl-il-sw.ctedgecdn.net/10tv_Desktop/r13_1000.m3u8"])

(->>
 (hiccup.page/html5
  [:head
   [:meta {:name :referrer
           :content "https://13tv.co.il/live/"}]]
  [:body
   (for [url urls]
     [:video {:controls true
              ;:autoplay true
              :muted true
              :onclick "return false;"
                ;:onmouseenter "this.muted = false;"
                ;:onmouseleave "this.muted = true;"
              :style "width: 33%;"}
      [:source {:src url}]])
   #_[:script "document.write('<script src=\"http://' + (location.host || 'localhost').split(':')[0] + ':35729/livereload.js?snipver=1\"></' + 'script>')"]])
 (spit "tv/index.html"))
