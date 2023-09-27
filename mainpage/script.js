document.addEventListener('DOMContentLoaded', function () {
  const loadingScreen = document.getElementById('loading-screen');
  const reloadButton = document.getElementById('reload-button');

 {
    const btn = document.querySelector('.btn');
    const header_container = document.querySelector('.header_container');

    btn.addEventListener('click',() => {
        btn.classList.toggle('active');
        header_container.classList.toggle('active');
    });
 }

  // ページ読み込みが完了したらダウンロード中の画面を非表示にする
  window.addEventListener('load', function () {
      loadingScreen.style.display = 'none';
  });

  // ページ再読み込みボタンがクリックされたらダウンロード中の画面を表示する
  reloadButton.addEventListener('click', function () {
      loadingScreen.style.display = 'block';

      // ページを再読み込みする
      window.location.reload();

      // なんかわからんけどブランチ分けるの忘れてこの分だけ書いてます
  });
});

window.addEventListener("beforeunload", function (event) {
  event.preventDefault(); // ページを離れる前のデフォルトのアクションを無効化
  event.returnValue = ""; // メッセージを表示するためのダミーのテキストを設定
  // メッセージを表示
  alert("ページをリロードしてもよろしいですか？");

  const reloadButton = document.getElementById('reload-button');

        // ページ再読み込みボタンがクリックされたときの処理
        reloadButton.addEventListener('click', function() {
            // firstpage.html にリダイレクト
            window.location.href = 'file:///Users/terashimakenshin/share-site-vtn/firstpage.html';
        });

      });

{
    document.addEventListener('DOMContentLoaded', function () {
        const links = document.querySelectorAll('a[href^="#"]');
      
        links.forEach(function (link) {
          link.addEventListener('click', function (e) {
            e.preventDefault();
      
            const targetId = this.getAttribute('href').substring(1);
            const targetElement = document.getElementById(targetId);
      
            if (targetElement) {
              window.scrollTo({
                top: targetElement.offsetTop,
                behavior: 'smooth' // スムーズなスクロール効果を追加する
              });
            }
          });
        });
      });
      
}

      // ページの読み込みが完了したら
    window.addEventListener('DOMContentLoaded', (event) => {
      // ヘッダー要素を取得
      const header = document.querySelector('header');

      const scrollThreshold = 80; //headerを固定し始める位置

      // スクロールイベントを監視
      window.addEventListener('scroll', () => {
          if (window.scrollY > scrollThreshold) {
              // スクロール位置が0より大きい場合、ヘッダーを固定
              header.classList.add('fixed-header');
          } else {
              // スクロール位置が0の場合、ヘッダーの固定を解除
              header.classList.remove('fixed-header');
          }
      });
  });

  {
    function submitForm() {
        var confirmationMessage = document.getElementById("confirmation-message");
        confirmationMessage.style.display = "block";

        document.getElementById("contact-form").reset();

        return false;
    }
  }