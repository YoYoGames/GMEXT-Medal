/**
 * @module home
 * @title Medal
 * @desc The Medal extension integrates GameMaker with Medal's local auto-clipping API.
 *
 * Report an in-game event worth clipping - a multi-kill, a boss defeat, a race win - and the Medal
 * desktop app saves a highlight from its replay buffer, titled with your event name and dropped into
 * the player's library.
 *
 * The request goes to Medal's listener on the player's own machine, so there is no round trip to a
 * remote server and no SDK to integrate.
 *
 * ## Getting started
 *
 * See ${page.getting_started} for the full walkthrough, and ${page.extension_options} for the three
 * options this extension exposes.
 *
 * In short: set the **Public Key** option, call ${function.medal_init} once, then call
 * ${function.medal_event_invoke} whenever something clip-worthy happens.
 *
 * ## The generated client
 *
 * The functions and structs under ${module.medal_api} and ${module.medal_schemas} are **generated**
 * from an OpenAPI specification checked into the repository at `spec/`. They are not hand-written, and
 * a fix belongs in the specification or the generator rather than in the generated GML.
 *
 * ${function.medal_init} is the one hand-written function, and exists because a specification cannot
 * describe where a credential comes from.
 *
 * [[Important: A successful response means Medal accepted the event request. It does not mean the
 * resulting clip has already finished processing - that happens asynchronously, and the clip appears
 * in the player's library after the configured duration has elapsed.]]
 *
 * @section_func Functions
 * @desc The hand-written entry point:
 * @ref medal_init
 * @section_end
 *
 * @section Modules
 * @desc The generated API surface - one page for the endpoint functions, one for the structs they
 * exchange. Both are generated from the OpenAPI specification.
 * @ref module.medal_api
 * @ref module.medal_schemas
 * @section_end
 *
 * @module_end
 */

/**
 * @func medal_init
 * @desc Hands the **Public Key** extension option to the generated client, which then sends it as the
 * `publicKey` header on every request.
 *
 * Call this once before your first ${function.medal_event_invoke} - the first room's Create event is
 * the usual place. If the option is empty the function writes a message to the debug output and
 * returns `false`; without a key, every request comes back `401`.
 *
 * This is the only hand-written function in the extension. It exists because an OpenAPI specification
 * cannot express where a credential comes from, and Medal's key is static configuration rather than
 * something obtained at runtime.
 *
 * @returns {Bool} Whether a non-empty public key was configured.
 *
 * @example
 * ```gml
 * if (!medal_init()) {
 *     show_debug_message("Medal is not configured; clip events will fail.");
 * }
 * ```
 * @func_end
 */
