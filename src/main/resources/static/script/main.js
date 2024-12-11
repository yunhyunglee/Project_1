// main.js
document.addEventListener('DOMContentLoaded', () => {
    const slider = document.querySelector('.slider');
    const slides = document.querySelectorAll('.slide');
    const prevBtn = document.querySelector('#prevBtn');
    const nextBtn = document.querySelector('#nextBtn');
    let currentIndex = 0;

    // Placeholder 이미지 경로
    const placeholder = 'http://placehold.co/1024x400';

    // 이미지가 로드되지 않을 경우 Placeholder로 대체
    slides.forEach(slide => {
        const img = slide.querySelector('img');
        img.addEventListener('error', () => {
            img.src = 'http://placehold.co/1024x400';
        });
    });

    // 슬라이드 이동 함수
    function showSlide(index) {
        const offset = -index * 100; // 이동 거리 계산
        slider.style.transform = `translateX(${offset}%)`;
    }

    // 이전 슬라이드로 이동
    function showPrevSlide() {
        currentIndex = (currentIndex - 1 + slides.length) % slides.length;
        showSlide(currentIndex);
    }

    // 다음 슬라이드로 이동
    function showNextSlide() {
        currentIndex = (currentIndex + 1) % slides.length;
        showSlide(currentIndex);
    }

    // 화살표 버튼 클릭 이벤트
    prevBtn.addEventListener('click', showPrevSlide);
    nextBtn.addEventListener('click', showNextSlide);

    // 자동 전환
    setInterval(showNextSlide, 3000); // 3초마다 슬라이드 전환
});
