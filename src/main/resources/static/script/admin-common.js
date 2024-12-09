function fetchAndPopulateModal(apiEndpoint, modalId, dataMapping) {
    fetch(apiEndpoint, { method: 'GET' })
        .then(response => {
            if (!response.ok) {
                throw new Error(`Failed to fetch data from ${apiEndpoint}`);
            }
            return response.json(); // 여기서 문제가 발생
        })
        .then(data => {
            // 데이터 매핑에 따라 필드 채우기
            Object.keys(dataMapping).forEach(key => {
                const elementId = dataMapping[key];
                const element = document.getElementById(elementId);
                if (element) {
                    element.value = data[key] || ''; // 데이터가 없을 경우 빈 값 설정
                } else {
                    console.error(`Element with ID "${elementId}" not found.`);
                }
            });
            const modal = document.getElementById(modalId);
            if (modal) {
                modal.style.display = "flex"; // 모달 열기
            } else {
                console.error(`Modal with ID "${modalId}" not found.`);
            }
        })
        .catch(error => {
            console.error("Error fetching data:", error);
            alert("데이터를 불러오는 중 문제가 발생했습니다.");
        });
}
