/*jslint browser:true*/
(function() {
        var HLS = window.Hls;

        document.querySelectorAll("video").forEach(function(video) {

            if (!(video.canPlayType('application/vnd.apple.mpegurl')) && HLS.isSupported()) {
                var src = video.children[0].src;

                if (src) {
                    var hls = new HLS();
                    hls.loadSource(src);
                    hls.attachMedia(video);
                }
            }
        });
    }
    ());
