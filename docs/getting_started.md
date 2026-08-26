@title Getting Started

This guide takes you from an empty project to a saved clip.

## Prerequisites

* The **Medal desktop app**, running on the machine the game runs on. The extension talks to a
  listener on the local loopback, so nothing works without it.
* A **Medal account**, and your game recognised by Medal.
* A **public key** for your game.

[[Note: Because the API is served on localhost, a clip is only ever captured on a machine that has
Medal installed and running. Calls on any other machine fail at the transport level rather than
returning an HTTP error - see *Handling responses* below.]]

## 1. Get a public key

Open the [Medal Auto-Clipping developer page](https://medal.tv/developer/auto-clipping) and follow the
**Build your integration** steps:

1. Enter your Medal username. This is the account that receives the test build.
2. Select your game from Medal's supported list, then give the app name and URL.
3. Use **Generate a public key** to create the key for the integration.
4. Define the events you want Medal to capture. Each gets an auto-assigned ID (`1`, `2`, `3`, ...),
   and players can toggle individual events on or off in Medal's settings - so it pays to define more
   than you think you need.
5. Submit for a test build and continue through Medal's process as instructed on that page.

[[Important: Keep the public key associated with the same Medal integration and event configuration
used when defining your events. The event IDs you send must match the ones you defined there.]]

## 2. Configure the extension

Open the **Medal** extension in the IDE and fill in its options - see ${page.extension_options} for
all three. At minimum, paste your key into **Public Key**.

## 3. Initialise

Call ${function.medal_init} once, before any other extension function. The first room's Create event
is the usual place:

```gml
medal_init();
```

It returns `false` and logs a message if the **Public Key** option is empty, which is worth checking
during development:

```gml
if (!medal_init()) {
    show_debug_message("Medal is not configured; clip events will fail.");
}
```

## 4. Report an event

Call ${function.medal_event_invoke} at the moment worth clipping, passing a
${struct.MedalEventInvokeRequest}:

```gml
medal_event_invoke(
    new MedalEventInvokeRequest(
        "1",                              // event ID, as defined in Medal
        "Triple Kill",                    // title shown on the clip card
        ["SaveClip"],                     // actions Medal should perform
        new MedalClipOptions(30, 5000)    // 30s clip, captured 5000ms after the event
    ),
    function(_status, _data, _request) {
        show_debug_message("Medal replied " + string(_status));
    }
);
```

That sends the following body to `http://localhost:12665/api/v1/event/invoke`, with your key in the
`publicKey` header:

```json
{
    "eventId": "1",
    "eventName": "Triple Kill",
    "triggerActions": ["SaveClip"],
    "clipOptions": {
        "duration": 30,
        "captureDelayMs": 5000
    }
}
```

`captureDelayMs` is how long Medal waits after the request before snapshotting the replay buffer,
which is useful for catching a killcam or another moment that happens just after the trigger.

## 5. Handle the response

The callback receives `(status, data, request)`. `status` is the HTTP status code, **or a negative
value when the request never reached a server at all** - which is what you get when the Medal desktop
app is not running, and is the most likely failure in practice.

```gml
function(_status, _data, _request) {
    if (_status < 0) {
        // No connection: Medal is probably not running.
        show_debug_message("Medal is not reachable.");
        return;
    }

    if (_status >= 200 && _status < 300) {
        // Accepted. The clip is still being processed.
        return;
    }

    if (_status == 401) {
        show_debug_message("Medal rejected the public key - check the Public Key option.");
        return;
    }

    show_debug_message("Medal error " + string(_status) + ": " + string(_data));
}
```

| Status | Meaning |
|---|---|
| `200` | The event was accepted. |
| `400` | A required field is missing or malformed. |
| `401` | The public key is missing or unrecognised. |
| negative | The request never reached Medal - the app is not running, or the port is blocked. |

[[Important: A `200` means Medal **accepted** the event, not that the clip exists yet. Medal processes
it asynchronously and the clip appears in the player's library once the configured duration has
elapsed.]]

## Cleanup

None required. The extension creates a persistent controller object on first use and tears down its
own state when the game ends.

## Testing notes

* Run the Medal desktop app before testing, or every call returns a negative status.
* Medal only captures for the **active game** it recognises. If events are accepted but no clip
  appears, that is usually the cause rather than anything in your code.
* Turn on the **Debug Logging** option to print every HTTP response to the output window.
