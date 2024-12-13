function confirmDeletion() {
    document.getElementById('confirmationModal').style.display = 'block';
}

function closeModal() {
    document.getElementById('confirmationModal').style.display = 'none';
}

function proceedDeletion() {
    document.getElementById('deleteForm').submit();
}
