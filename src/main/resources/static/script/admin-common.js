function fetchAndPopulateModal(apiEndpoint, modalId, dataMapping) {
    fetch(apiEndpoint, { method: 'GET' })
        .then(response => {
            if (!response.ok) {
                throw new Error(`Failed to fetch data from ${apiEndpoint}`);
            }
            return response.json();
        })
        .then(data => {
            Object.keys(dataMapping).forEach(key => {
                const elementId = dataMapping[key];
                const element = document.getElementById(elementId);
                if (element) {
                    element.value = data[key] || '';
                    if (element.type === 'checkbox') {
                        element.checked = data[key] ? true : false;
                    } else {
                        element.value = data[key] || '';
                    }
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

// 모달 닫기 함수
function closeEditModal(modalId) {
    document.getElementById(modalId).style.display = "none";
}



function filterItems(queryId, className) {
    const query = document.getElementById(queryId).value.toLowerCase();
    const items = document.getElementsByClassName(className);

    Array.from(items).forEach(item => {
        const text = item.textContent.toLowerCase();
        item.style.display = text.includes(query) ? "block" : "none";
    });
}



function deleteItem(apiEndpoint, confirmMessage) {
    if (confirm(confirmMessage)) {
        fetch(apiEndpoint, { method: 'DELETE' })
            .then(response => {
                if (!response.ok) {
                    throw new Error("Failed to delete the item.");
                }
                return response.text();
            })
            .then(result => {
                alert(result);
                location.reload(); // 삭제 후 페이지 새로고침
            })
            .catch(error => {
                console.error("Error deleting item:", error);
                alert("삭제 중 문제가 발생했습니다.");
            });
    }
}



function submitForm(apiEndpoint, formId, modalId) {
    const formElement = document.getElementById(formId);
    if (!formElement) {
        console.error(`Form with ID "${formId}" not found.`);
        return;
    }

    const formData = new FormData(formElement);
    const checkboxes = formElement.querySelectorAll('input[type="checkbox"]');
    checkboxes.forEach(checkbox => {
        formData.set(checkbox.name, checkbox.checked ? 'true' : 'false');
    });

    fetch(apiEndpoint, {
        method: 'POST',
        body: formData
    })
        .then(response => {
            if (!response.ok) {
                throw new Error("Failed to submit the form.");
            }
            return response.text();
        })
        .then(result => {
            alert(result);
            closeEditModal(modalId); // 모달 닫기
            location.reload(); // 페이지 새로고침
        })
        .catch(error => {
            console.error("Error submitting form:", error);
            alert("수정 중 문제가 발생했습니다.");
        });
}


