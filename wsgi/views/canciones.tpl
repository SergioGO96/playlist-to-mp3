% include('header.tpl')
    <div class="docs-content">
      <h3> Canciones de la lista seleccionada listas </h3>
      %for cancion in lista_canciones:
		<p>{{cancion}}</p>
		{{lista_canciones}}
      %end
	</div>
% include('footer.tpl')
