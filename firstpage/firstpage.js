document.addEventListener('DOMContentLoaded' , function() {


  const buttonOpen = document.getElementById('modalOpen');
  const modal = document.getElementById('easyModal');
const buttonClose = document.getElementsByClassName('modalClose')[0];

// ボタンがクリックされた時
buttonOpen.addEventListener('click', redirectToAnotherPage);
function redirectToAnotherPage() {
  window.location.href ='file:///Users/kenshinterashima/Desktop/simple-site/mainpage/index.html';
  ;
}

// バツ印がクリックされた時
buttonClose.addEventListener('click', modalClose);
function modalClose() {
  modal.style.display = 'none';
}

// モーダルコンテンツ以外がクリックされた時
addEventListener('click', outsideClose);
function outsideClose(e) {
  if (e.target == modal) {
    modal.style.display = 'none';
  }
}
});