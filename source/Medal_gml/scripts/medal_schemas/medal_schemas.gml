// #####################################################################
// # Schema Definitions (auto-generated, DO NOT EDIT)
// #####################################################################

/**
 * @func MedalClipOptions(_duration, _capture_delay_ms = undefined)
 * How Medal should capture the clip for this event.
 * @param {Real} _duration Length of the saved clip in seconds. Medal documents a typical range of 15 to 60.
 * @param {Real} [_capture_delay_ms] Milliseconds Medal waits after the request before snapshotting the replay buffer. Useful for catching a killcam or another post-action moment.
 */
function MedalClipOptions(_duration, _capture_delay_ms = undefined) constructor
{
    duration = _duration;
    captureDelayMs = _capture_delay_ms;
}

/**
 * @func MedalEventInvokeRequest(_event_id, _event_name, _trigger_actions, _clip_options)
 * The body of a clip-worthy game event.
 * @param {String} _event_id The numeric ID assigned to this event, as a string (for example "1"). Medal uses it to let players toggle individual events on or off.
 * @param {String} _event_name Display name used to label the clip card in Medal.
 * @param {Array<String>} _trigger_actions The actions Medal should perform for this event. Use ["SaveClip"] to record and save a highlight.
 * @param {Struct.MedalClipOptions} _clip_options How Medal should capture the clip for this event.
 */
function MedalEventInvokeRequest(_event_id, _event_name, _trigger_actions, _clip_options) constructor
{
    eventId = _event_id;
    eventName = _event_name;
    triggerActions = _trigger_actions;
    clipOptions = _clip_options;
}

/**
 * @func MedalClipOptions_validate(__inst__, __where__)
 * @param {Any} __inst__ The value to be validated.
 * @param {String} [__where__] Caller location, used in error messages.
 * @ignore 
 */
function MedalClipOptions_validate(__inst__, __where__ = _GMFUNCTION_)
{
    __where__ = $"{__where__} :: MedalClipOptions_validate";

    if (!is_struct(__inst__)) throw $"{__where__} :: expected Struct.MedalClipOptions";

    if (!is_numeric(__inst__[$ "duration"])) throw $"{__where__} :: 'duration' expected Real";
    if (!is_undefined(__inst__[$ "captureDelayMs"]))
    {
        if (!is_numeric(__inst__[$ "captureDelayMs"])) throw $"{__where__} :: 'captureDelayMs' expected Real";
    }
}

/**
 * @func MedalEventInvokeRequest_validate(__inst__, __where__)
 * @param {Any} __inst__ The value to be validated.
 * @param {String} [__where__] Caller location, used in error messages.
 * @ignore 
 */
function MedalEventInvokeRequest_validate(__inst__, __where__ = _GMFUNCTION_)
{
    __where__ = $"{__where__} :: MedalEventInvokeRequest_validate";

    if (!is_struct(__inst__)) throw $"{__where__} :: expected Struct.MedalEventInvokeRequest";

    if (!is_string(__inst__[$ "eventId"])) throw $"{__where__} :: 'eventId' expected String";
    if (!is_string(__inst__[$ "eventName"])) throw $"{__where__} :: 'eventName' expected String";
    if (!is_array(__inst__[$ "triggerActions"])) throw $"{__where__} :: 'triggerActions' expected Array<String>";
    MedalClipOptions_validate(__inst__[$ "clipOptions"], $"{__where__} :: 'clipOptions'");
}

