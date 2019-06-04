import "bootstrap";
import "particles.js";
// import "../components/sign_up";

if (document.getElementById('login-form')) {
  particlesJS.load('particles-js', '../assets/particles.json', function() {
    console.log('callback - particles.js config loaded');
  });
}
