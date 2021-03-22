window.addEventListener('load', () => {
    // 
    const priceInput = document.getElementById("item-price");    
    priceInput.addEventListener("input", () => {
       const inputValue = priceInput.value; //priceInput.valueのvalue部分は、IDで取得してきたHTMlの中から、値の部分だけを選択していることが
        console.log(inputValue);
    //
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1)); //Math.floorは、計算するときに付けなければいけない。innerHTMLはそれを埋め込んでいる。
    console.log(addTaxDom);
    //
    const profitNumber = document.getElementById("profit")
    const value_result = inputValue * 0.1
    console.log(value_result)
    profitNumber.innerHTML = (Math.floor(inputValue - value_result));
      console.log(profitNumber);

    })
});