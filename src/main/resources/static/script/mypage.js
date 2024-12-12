function confirmDeletion() {
    document.getElementById('confirmationModal').style.display = 'block';
}

function closeModal() {
    document.getElementById('confirmationModal').style.display = 'none';
}

function proceedDeletion() {
    document.getElementById('deleteForm').submit();
}
//
// function toggleHeart(button, productId) {
//     const icon = button.querySelector("i");
//
//     // 현재 찜 상태에 따라 API 호출 및 UI 업데이트
//     if (icon.classList.contains("fi-rs-heart")) {
//         // 빈 하트를 채워진 하트로 변경
//         icon.classList.remove("fi-rs-heart");
//         icon.classList.add("fi-ss-heart");
//
//         // 서버에 찜 추가 요청
//         fetch(`/wishlist/add?productId=${productId}`, { method: "POST" })
//             .then((response) => {
//                 if (!response.ok) throw new Error("찜 추가 실패");
//                 return response.text();
//             })
//             .then((message) => {
//                 console.log(message);
//             })
//             .catch((error) => {
//                 console.error(error);
//                 // 실패 시 UI 롤백
//                 icon.classList.remove("fi-ss-heart");
//                 icon.classList.add("fi-rs-heart");
//             });
//     } else {
//         // 채워진 하트를 빈 하트로 변경
//         icon.classList.remove("fi-ss-heart");
//         icon.classList.add("fi-rs-heart");
//
//         // 서버에 찜 제거 요청
//         fetch(`/wishlist/remove?productId=${productId}`, { method: "POST" })
//             .then((response) => {
//                 if (!response.ok) throw new Error("찜 제거 실패");
//                 return response.text();
//             })
//             .then((message) => {
//                 console.log(message);
//                 // 성공 시 목록에서 제거
//                 button.closest(".mypage-zzim-item").remove();
//             })
//             .catch((error) => {
//                 console.error(error);
//                 // 실패 시 UI 롤백
//                 icon.classList.remove("fi-rs-heart");
//                 icon.classList.add("fi-ss-heart");
//             });
//     }
// }
