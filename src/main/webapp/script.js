const menuToggle = document.getElementById('menuToggle');
const mainNav = document.getElementById('mainNav');
const overlay = document.getElementById('overlay');
const closeBtn = document.querySelector('.close-btn');

function openMenu() {
    mainNav.classList.add('active');
    overlay.classList.add('active');
    document.body.style.overflow = 'hidden';
}

function closeMenu() {
    mainNav.classList.remove('active');
    overlay.classList.remove('active');
    document.body.style.overflow = '';
}

if (menuToggle) {
    menuToggle.addEventListener('click', openMenu);
}

if (closeBtn) {
    closeBtn.addEventListener('click', closeMenu);
}

if (overlay) {
    overlay.addEventListener('click', closeMenu);
}

document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') {
        closeMenu();
    }
});
