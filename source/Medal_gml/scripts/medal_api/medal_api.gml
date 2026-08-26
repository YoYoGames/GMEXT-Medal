// #####################################################################
// # Endpoint Definitions (auto-generated, DO NOT EDIT)
// #####################################################################

/**
 * @func medal_event_invoke(_body = undefined, _callback = undefined)
 * Tells Medal that something worth clipping just happened. A 200 means Medal accepted the event; the clip itself is processed asynchronously and appears in the player's library after the configured duration has elapsed.
 * @param {Struct.MedalEventInvokeRequest} [_body] The body to be included in the http request.
 * @param {Function} [_callback] Callback with signature (status, data, request). status is the HTTP status code, or negative when the request never reached a server.
 */
function medal_event_invoke(_body = undefined, _callback = undefined)
{
    var __base_url__ = _medal_options_get_rest_url();

    var __content_type__ = "application/json";

    // argument validation
    var __where__ = _GMFUNCTION_;

    MedalEventInvokeRequest_validate(_body, $"{__where__} :: '_body'");
    if (!is_undefined(_callback))
    {
        if (!is_callable(_callback)) throw $"{__where__} :: '_callback' expected Function";
    }

    // build url path
    var __url__ = $"{__base_url__}/api/v1/event/invoke";

    var __security__ = [ "publicKey" ];

    return _medal_create_request(__url__, undefined, "POST", undefined, _body, __content_type__, __security__, undefined, _callback, _GMFUNCTION_);
}

