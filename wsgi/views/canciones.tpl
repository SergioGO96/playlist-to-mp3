% include('header.tpl')
    <div class="docs-content">
      <h3> Canciones de la lista seleccionada listas </h3>
      %for cancion in lista_canciones:
		<p>{{cancion}}</p>
      %end
	</div>
% include('footer.tpl')
