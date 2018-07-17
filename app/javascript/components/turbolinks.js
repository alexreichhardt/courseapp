function listenToTurbolinks() {
  document.addEventListener('turbolinks:load', () => {
    console.log("Turbolinks loaded!")
  });

  document.addEventListener('turbolinks:click', () => {
    console.log("Click!")
  });

  document.addEventListener('turbolinks:request-start', () => {
    console.log("Request started!")
  });

  document.addEventListener('turbolinks:request-end', () => {
    console.log("Request ended!")
  });
}

export { listenToTurbolinks }
