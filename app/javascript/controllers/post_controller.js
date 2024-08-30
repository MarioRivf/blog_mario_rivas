import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="post"
export default class extends Controller {
  static targets = ["title", "body", "userId", "errorMessages", "errorList"]

  submit(event) {
    event.preventDefault()
    const url = this.element.action
    const method = this.element.method.toUpperCase()
    const data = {
      post: {
        title: this.titleTarget.value,
        body: this.bodyTarget.value,
        user_id: this.userIdTarget.value
      }
    }

    fetch(url, {
      method: method,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: JSON.stringify(data)
    })
      .then(response => response.json())
      .then(data => {
        if (data.errors) {
          this.displayErrors(data.errors)
        } else {
          if (window.location.pathname.includes('new')) {
            window.location.href = `/posts/new`
          } else {
            window.location.href = `/posts/${data.id}`
          }
        }
      })
      .catch(error => {
        console.error("Error:", error)
      })
  }

  displayErrors(errors) {
    this.errorListTarget.innerHTML = ""
    this.errorMessagesTarget.classList.remove("d-none")

    for (const [field, messages] of Object.entries(errors)) {
      messages.forEach(message => {
        const li = document.createElement("li")
        li.textContent = `${field} ${message}`
        this.errorListTarget.appendChild(li)
      })
    }
  }
}
