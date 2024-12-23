const pay = () => {
  console.log("OK");
  const payjp = Payjp("pk_test_57e8e3d0c1b46cf341aaea64");

  const form = document.getElementById("charge-form");

  payjp.createToken(numberElement).then(function (response) {
    if (response.error) {
      console.error(response.error.message);
      alert(response.error.message);
    } else {
      const token = response.id;
      const renderDom = document.getElementById("charge-form");
      const tokenObj = `<input value=${token} type="hidden" name='token'>`;
      renderDom.insertAdjacentHTML("beforeend", tokenObj);

      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();

      document.getElementById("charge-form").submit();
    }
  });
};

window.addEventListener("turbo:load", pay);