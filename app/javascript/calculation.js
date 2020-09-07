window.addEventListener("load", function(){
  const input = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  input.addEventListener('input', keisan);
  function keisan() {
    number = input.value * 0.1
    result1 = Math.ceil(number)
    tax.innerHTML = result1
    console.log(tax.innerHTML)
  }
})