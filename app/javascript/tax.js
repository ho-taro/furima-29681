function tax (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const salesFee = itemPrice.value / 10;
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${parseInt(salesFee, 10).toLocaleString()}`;
    const salesProfit = itemPrice.value /10 *9
    const profit = document.getElementById("profit");
    console.log(`${salesProfit}`)
    profit.innerHTML = `${parseInt(salesProfit, 10).toLocaleString()}`;
  });
}

window.addEventListener('load', tax);