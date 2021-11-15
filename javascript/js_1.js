function alert_1() {
  alert("Hei!");
  window.scrollTo({
    top: 100,
    left: 500,
    behavior: 'smooth'
  });
}
document.getElementById("lenke_1").addEventListener("mouseup", goto);
function goto() {
  alert("Klikk");
  el = document.getElementById("lenke_1");
  window.scrollTo({
    top: 30,
    left: 30,
    behavior: 'smooth'
  });
}
