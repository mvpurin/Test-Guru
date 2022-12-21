document.addEventListener('turbolinks:load', function() {
  const progressBar = document.getElementById("progressBar");
  const progressNext = document.getElementById("next_button");

  if (progressBar) {
    window.addEventListener('load', move);
  }
})

function move() {
  let barStatus = document.getElementById("barStatus");
  let active = barStatus.dataset.questionCounter;
  let steps = barStatus.dataset.questionCount;

  barStatus.style.width = (active / steps) * 100 + "%";

}
