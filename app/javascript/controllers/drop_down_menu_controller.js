import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="drop-down-menu"
export default class extends Controller {
  static targets = ["links"]

  connect() {
    console.log("hello")
  }

  activate() {
    this.linksTarget.classList.toggle("d-none");
  }
}
