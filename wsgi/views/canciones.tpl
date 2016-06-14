% include('header.tpl')
    <div class="docs-content">
      <h3> Canciones de la lista seleccionada listas </h3>
      %for 
      %for cancion in lista_canciones['items']:
		<p>{{cancion}}</p>
         <br>
      %end
	</div>
% include('footer.tpl')
