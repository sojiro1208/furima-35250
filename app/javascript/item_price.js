window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const taxNumber = document.getElementById("add-tax-price")
    const value_result = inputValue * 0.1
    taxNumber.innerHTML = (Math.floor(inputValue * 0.1));

    const profitNumber = document.getElementById("profit")
    profitNumber.innerHTML = (Math.floor(inputValue - value_result));
})
});


