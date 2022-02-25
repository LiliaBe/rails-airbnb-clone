import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("hello from music_controller!")
  }

  play(event) {
    console.log(event.target)
    const audio = new Audio(event.target.id);
    audio.play();
  }

}
