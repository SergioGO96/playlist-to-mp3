% include('header.tpl')
    <div class="docs-content">
      <h3> Canciones de la lista seleccionada listas </h3>
      %for cancion in lista_canciones:
		<p>{{cancion[nombre] - cancion[url_youtube]}}</p>
		{{lista_canciones}}
      %end
	</div>
% include('footer.tpl')
