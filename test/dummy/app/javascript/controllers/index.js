// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom, lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// Lazy load FlatPack controllers on first use.
// FlatPack identifiers are namespaced (for example, flat-pack--date-input),
// so loading starts at "controllers" rather than "controllers/flat_pack".
lazyLoadControllersFrom("controllers", application)
