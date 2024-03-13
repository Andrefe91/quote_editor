// Entry point for the build script in your package.json

import "@hotwired/turbo-rails"
import "./controllers"

// In teory, the two next lines disable turbo in the whole application, however it doesnt really work for me,
//dont know why.
//import { Turbo } from "@hotwired/turbo-rails"
//Turbo.session.drive = false


