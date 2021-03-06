const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

     const formResult = document.getElementById("charge-form");
     const formData = new FormData(formResult);

    const card = {
      number: formData.get("buy_product_ship[number]"),
      cvc: formData.get("buy_product_ship[cvc]"),
      exp_month: formData.get("buy_product_ship[exp_month]"),
      exp_year: `20${formData.get("buy_product_ship[exp_year]")}`,
    };
    
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      //、フォームに存在するクレジットカードの各情報を削除する記述
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      //フォームの情報をサーバーサイドに送信する記述
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);
