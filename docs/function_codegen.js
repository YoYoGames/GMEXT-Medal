// #####################################################################
// # Endpoint Documentation (auto-generated, DO NOT EDIT)
// #####################################################################

/**
 * @func_partial medal_event_invoke
 * Tells Medal that something worth clipping just happened. A 200 means Medal accepted the event; the clip itself is processed asynchronously and appears in the player's library after the configured duration has elapsed.
 * @param {Struct.MedalEventInvokeRequest} [_body] The body to be included in the http request.
 * @param {Function} [_callback] Callback with signature (status, data, request). status is the HTTP status code, or negative when the request never reached a server.
 * 
 * @event callback
 * @member {Real} _status The HTTP status code, or a negative value if the request never reached a server (no connection). Check for a negative value before treating it as an HTTP code.
 * @member {Any} _data
 * @member {Struct.MedalRequest} _request
 * @event_end 
 * @func_end
 */
function medal_event_invoke(_body = undefined, _callback = undefined)
{
}

