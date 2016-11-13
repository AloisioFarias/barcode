var imgArray = new Array();

imgArray[0] = new Image();
imgArray[0].src = "./css2/images/FLUXO_LOGIN.jpg";

imgArray[1] = new Image();
imgArray[1].src = "./css2/images/FLUXO_COMPRA.jpg";

imgArray[2] = new Image();
imgArray[2].src = "./css2/images/FLUXO_INGRED.jpg";

imgArray[3] = new Image();
imgArray[3].src = "./css2/images/FLUXO_FOOD.jpg";

imgArray[4] = new Image();
imgArray[4].src = "./css2/images/FLUXO_DONE.jpg";

imgArray[5] = new Image();
imgArray[5].src = "./css2/images/PAGAMENTO.jpg";

function unloadEvt() {
    document.location.href='DataSourceServlet';
}

function mostraImagem(index) {
	
	var img = document.createElement("IMG");
	document.getElementById('id').appendChild(imgArray[index]);
	
}
