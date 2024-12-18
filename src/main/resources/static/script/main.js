document.addEventListener('DOMContentLoaded', () => {
    const slider = document.querySelector('.slider');
    const prevBtn = document.querySelector('#prevBtn');
    const nextBtn = document.querySelector('#nextBtn');
    let currentIndex = 0;

    // 서버에서 활성화된 배너 데이터 가져오기
    fetch('/activeBanners')
        .then(response => response.json())
        .then(banners => {
            // 활성화된 배너가 없으면 에러 출력
            if (!banners || banners.length === 0) {
                console.error('활성화된 배너가 없습니다.');
                return;
            }

            // 기존 슬라이더 내용을 초기화
            slider.innerHTML = '';

            // 슬라이더에 배너 데이터 추가
            banners.forEach(banner => {
                const slide = document.createElement('div');
                slide.classList.add('slide');
                slide.innerHTML = `
                    <img src="${banner.image}" alt="${banner.title}" onerror="this.src='http://placehold.co/1024x400'">
                    <div class="slide-content">
                        <a href="${banner.link}" target="_blank"> 보기</a>
                    </div>
                `;
                slider.appendChild(slide);
            });

            const slides = slider.querySelectorAll('.slide');

            // 슬라이드 이동 함수
            function showSlide(index) {
                const offset = -index * 100;
                slider.style.transform = `translateX(${offset}%)`;
            }

            // 이전 버튼 클릭 이벤트
            prevBtn.addEventListener('click', () => {
                currentIndex = (currentIndex - 1 + slides.length) % slides.length;
                showSlide(currentIndex);
            });

            // 다음 버튼 클릭 이벤트
            nextBtn.addEventListener('click', () => {
                currentIndex = (currentIndex + 1) % slides.length;
                showSlide(currentIndex);
            });

            // 자동 슬라이드 전환
            setInterval(() => {
                currentIndex = (currentIndex + 1) % slides.length;
                showSlide(currentIndex);
            }, 3000);
        })
        .catch(err => console.error('Error loading banners:', err));
});


document.addEventListener("DOMContentLoaded", function () {
    const categoryButton = document.querySelector(".nav-item.categories");
    const dropdownMenu = document.querySelector(".dropdown-menu");

    categoryButton.addEventListener("click", function (event) {
        event.preventDefault(); // 기본 동작 막기
        dropdownMenu.style.display =
            dropdownMenu.style.display === "block" ? "none" : "block";
    });

    // 메뉴 외부 클릭 시 닫기
    document.addEventListener("click", function (event) {
        if (!categoryButton.contains(event.target) && !dropdownMenu.contains(event.target)) {
            dropdownMenu.style.display = "none";
        }
    });
});


