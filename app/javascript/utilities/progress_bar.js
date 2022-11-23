document.addEventListener('turbolinks:load', function() {
  const progressBar = document.getElementById("progressBar");
  const progressNext = document.getElementById("next_button");

  if (progressBar) {
    // progressNext.addEventListener('click', move);
    window.addEventListener('load', move);
  }
})

function move() {
  let barStatus = document.getElementById("barStatus");
  let active = barStatus.dataset.questionCounter;
  let steps = barStatus.dataset.questionCount;

  updateBarStatus(barStatus,steps,active);

  function updateBarStatus(barStatus,steps,active) {
     barStatus.style.width = (active / steps) * 100 + "%";
  }
}
