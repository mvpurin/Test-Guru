document.addEventListener('turbolinks:load', function() {
  const timer = document.getElementById("timer");

  if (timer) {
    const timerValue = timer.dataset.timer;
    let timerFinish = new Date(timerValue).getTime();
    let delay = 1000;
    setInterval(countdown, delay, timer, timerFinish);
  }
})

function countdown(timer, timerFinish) {
  let currentTime = new Date().getTime();
  let restTime = timerFinish - currentTime;

  let minutes = Math.floor(restTime / (1000 * 60));
  let seconds = Math.floor((restTime - minutes * 60 * 1000) / 1000);

  timer.textContent = minutes + ":" + seconds;

  if (restTime <= 0) {
    timer.textContent = "0:0";
    const form1 = document.getElementsByClassName('testPassageForm');
    const elem = form1[0];
    const testPassageId = elem.dataset.testPassageId;

    window.location.replace(testPassageId + '/result');
  }
}
