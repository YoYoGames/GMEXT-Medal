// #####################################################################
// # Schema Documentation (auto-generated, DO NOT EDIT)
// #####################################################################

/**
 * @struct_partial MedalClipOptions
 * @member {Real} duration Length of the saved clip in seconds. Medal documents a typical range of 15 to 60.
 * @member {Real} [captureDelayMs] Milliseconds Medal waits after the request before snapshotting the replay buffer. Useful for catching a killcam or another post-action moment.
 * @struct_end
 */

/**
 * @struct_partial MedalEventInvokeRequest
 * @member {String} eventId The numeric ID assigned to this event, as a string (for example "1"). Medal uses it to let players toggle individual events on or off.
 * @member {String} eventName Display name used to label the clip card in Medal.
 * @member {Array[String]} triggerActions The actions Medal should perform for this event. Use ["SaveClip"] to record and save a highlight.
 * @member {Struct.MedalClipOptions} clipOptions How Medal should capture the clip for this event.
 * @struct_end
 */

/**
 * @struct_partial MedalRequest
 * @desc The in-flight HTTP request, handed to every callback as its third argument.
 * Call `retry()` on it to send the same request again - useful from a response hook that
 * has just refreshed a credential. `get_callback()` returns the callback it will invoke.
 * @member {Real} attempts How many times this request has been sent, including retries.
 * @struct_end
 */

