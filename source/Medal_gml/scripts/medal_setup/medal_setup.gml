// Hand-written glue. Not generated - safe to edit.
//
// The generated client keeps its credential in an auth-token store, because a
// spec cannot know where a key comes from. Medal's key is static configuration,
// so this reads it from the extension option and hands it over.

/// @func medal_init()
/// @desc Wires the PublicKey extension option into the generated client. Call
///       once before the first medal_event_invoke, e.g. in the first room's
///       Create event. Returns whether a key was actually configured.
/// @returns {Bool}
function medal_init()
{
    var _key = extension_get_option_value("Medal", "PublicKey");

    if (!is_string(_key) || string_trim(_key) == "")
    {
        show_debug_message(
            "[Medal] PublicKey option is empty. Every request will fail with HTTP 401. " +
            "Generate a key at medal.tv/developer/auto-clipping and set it in the " +
            "Medal extension options."
        );
        return false;
    }

    medal_request_auth_set_token("publicKey", _key);
    return true;
}
