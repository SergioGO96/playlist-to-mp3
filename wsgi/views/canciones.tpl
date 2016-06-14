% include('header.tpl')
    <div class="docs-content">
      <h3> Canciones de la lista seleccionada </h3>
      %for cancion in lista_canciones:
		<p>{{cancion["nombre"]}} - {{cancion["url_youtube"]}}</p>
		<iframe width="320" height="240" src="https://www.youtube.com/embed/{{cancion["url_youtube"]}}" frameborder="0" allowfullscreen></iframe>
      %end
	{{lista_canciones}}
	</div>
% include('footer.tpl')
