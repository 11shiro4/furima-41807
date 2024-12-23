const pay = () => {
  console.log("OK");
  const publicKey = gon.public_key

  const token = response.id;
  const renderDom = document.getElementById("charge-form");
  const tokenObj = `<input value=${token} type="hidden" name='token'>`;
  renderDom.insertAdjacentHTML("beforeend", tokenObj);
};

window.addEventListener("turbo:load", pay);



