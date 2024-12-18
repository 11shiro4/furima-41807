const price = () => {
  console.log("OK");

  const priceInput = document.getElementById("item-price");
  // if (priceInput) {
    console.log(priceInput);

    priceInput.addEventListener("input", () => {
      const inputValue = parseInt(priceInput.value, 10);

      const addTaxDom = document.getElementById("add-tax-price");
      const profitDom = document.getElementById("profit");

      if (!isNaN(inputValue) && inputValue >= 300 && inputValue <= 9999999) {
        const fee = Math.floor(inputValue * 0.1);
        const profit = inputValue - fee;

        addTaxDom.innerHTML = fee.toLocaleString();
        profitDom.innerHTML = profit.toLocaleString();
      } else {
        addTaxDom.innerHTML = "-";
        profitDom.innerHTML = "-";
      }
    });
  // }
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);