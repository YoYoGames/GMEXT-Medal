//1: Triple Kill
//2: Match Won
//3: Ace
//4: Headshot
//5: GM Test
medal_event_invoke(
    new MedalEventInvokeRequest(
        "1",
        "Triple Kill",
        ["SaveClip"],
        new MedalClipOptions(30, 5000)
    ),
    function(_status, _data, _request) {
        if (_status >= 200 && _status < 300) {
            show_debug_message("[API CLIP OK] " + string(_data));
            return;
        }

        // 401 is the one the developer can act on: the PublicKey option is
        // unset or Medal does not recognise it.
        if (_status == 401) {
            show_debug_message("[API CLIP FAIL] 401 - check the Medal PublicKey option");
            return;
        }

        show_debug_message("[API CLIP FAIL] " + string(_status) + " " + string(_data));
    }
);
