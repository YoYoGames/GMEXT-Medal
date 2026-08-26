# GMEXT-Medal
Repository for GameMaker's Medal Extension

This repository was created with the intent of presenting users with the latest version available of the extension (even previous to marketplace updates) and also provide a way for the community to contribute with bug fixes and feature implementation.

The extension reports clip-worthy game events to the Medal desktop app, which saves a highlight from its replay buffer.

This extension is pure GML, with no native libraries, so it will work on every platform.

## Requirements

* The **Medal desktop app** must be running on the player's machine. The API is served on the local loopback only, so nothing is sent to a remote server by this extension.
* A **public key** for your game, generated from the [Medal Auto-Clipping developer page](https://medal.tv/developer/auto-clipping).
* Your game must be recognised by Medal. The developer page walks through registering it and defining the events you want captured.

> [!IMPORTANT]
> Set the **Public Key** extension option before calling any extension function, then call `medal_init()` once to hand it to the client. Without it every request fails with `401`.

> [!NOTE]
> The **Server URL** option holds only the base URL of Medal's local listener (`http://localhost:12665`). The endpoint path is supplied by the extension, so do not append it.

## The REST client is generated

The client is generated from an OpenAPI specification by [GM-OpenAPIGenerator](https://github.com/YoYoGames/GM-OpenAPIGenerator). The specification and the generator configuration are checked in under `spec/`, so regenerating is:

```
cd spec && openapigen --config ./config.json
```

The generated scripts (`medal_api`, `medal_schemas`, `medal_helpers`) and the `obj_medal_core` events are **never hand-edited** - a fix belongs in the generator or the spec. `medal_setup` is hand-written and is the one place that is safe to edit.

Medal retired its own developer documentation during 2026, so the checked-in specification is transcribed from the one surviving page and is the only machine-readable record of this API.

## Documentation

* Check [the documentation](../../wiki)

The online documentation is regularly updated to ensure it contains the most current information. For those who prefer a different format, we also offer a HTML version. This HTML is directly converted from the GitHub Wiki content, ensuring consistency, although it may follow slightly behind in updates.

We encourage users to refer primarily to the GitHub Wiki for the latest information and updates. The HTML version, included with the extension and within the demo project's data files, serves as a secondary, static reference.

Additionally, if you're contributing new features through PR (Pull Requests), we kindly ask that you also provide accompanying documentation for these features, to maintain the comprehensiveness and usefulness of our resources.
