@title Extension Options

The Medal extension exposes three options. Open them in the IDE by selecting the **Medal** extension
in the Asset Browser and using the options button, or by double-clicking the extension and choosing
the platform-independent options.

## Public Key

| | |
|---|---|
| Type | String |
| Required | **Yes** |
| Default | *(empty)* |

The public key generated for your game on the
[Medal Auto-Clipping developer page](https://medal.tv/developer/auto-clipping). The extension sends it
in the `publicKey` header of every request.

${function.medal_init} reads this option and hands it to the generated client, so the key is never
written into your game's code. Without it, every request comes back `401`.

[[Important: Keep this key associated with the same Medal integration and event configuration used
when defining your events - the event IDs you send must match the ones defined against this key.]]

## Server URL

| | |
|---|---|
| Type | String |
| Required | No |
| Default | `http://localhost:12665` |

The base URL of the Medal desktop app's local listener. There is normally no reason to change it; the
option exists in case Medal ever serves on a different port.

[[Warning: This is the **base URL only**. The endpoint path is supplied by the extension, so do not
append `/api/v1/event/invoke` to it - doing so produces a malformed request URL.]]

## Debug Logging

| | |
|---|---|
| Type | Boolean |
| Required | No |
| Default | `False` |

When enabled, every HTTP response is written to the debug output, including the raw `async_load`
contents. Useful while integrating; leave it off in a shipping build.

## Platform notes

The extension is pure GML with no native code, so these options behave identically on every export.
The API itself is served on the local loopback, which means clips are only ever captured on a machine
running the Medal desktop app.
