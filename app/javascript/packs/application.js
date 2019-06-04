import "bootstrap";
import "particles.js";

if (document.getElementById('login-form')) {
  particlesJS.load('particles-js', '../assets/particles.json', function() {
    console.log('callback - particles.js config loaded');
  });
}
