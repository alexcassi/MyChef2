//crea lista delle ricette
$(() => {
	var email = sessionStorage.getItem('chef_email');
	$.ajax({
		url: 'ListaRicetteServlet?chef_email=' + email,
		method: 'get'
	})
	.done((u) => {
		console.log(u);
		var lista_ricette = u;
		var cList = $('ul.mylist')
		$.each(lista_ricette, function(i)
		{
		    var li = $('<li/>')
		        .appendTo(cList);
		    var aaa = $('<a/>')
		    	.attr('href','DettagliRicettaServlet?id_ricetta='+lista_ricette[i].id)
		        .text(lista_ricette[i].nome_ricetta)
		        .appendTo(li);
		});
		
		var eee = $('<a/>')
			.text('la mia specialit\u00E0 \u00E8: '+lista_ricette[0].nome_ricetta)
			.appendTo('#spec');

	});
});
