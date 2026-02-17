// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

Turbo.setConfirmMethod((message) => {
  const dialog = document.createElement("dialog")
  dialog.classList.add("confirm-dialog")
  dialog.innerHTML = `
    <div class="confirm-dialog-content">
      <p>${message}</p>
      <div class="confirm-dialog-actions">
        <button class="btn btn-secondary" value="cancel">Cancel</button>
        <button class="btn btn-danger" value="confirm">Delete</button>
      </div>
    </div>
  `
  document.body.appendChild(dialog)
  dialog.showModal()

  return new Promise((resolve) => {
    dialog.addEventListener("close", () => {
      resolve(dialog.returnValue === "confirm")
      dialog.remove()
    })
    dialog.querySelectorAll("button").forEach((button) => {
      button.addEventListener("click", () => {
        dialog.returnValue = button.value
        dialog.close()
      })
    })
  })
})
