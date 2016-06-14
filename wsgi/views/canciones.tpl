% include('header.tpl')
    <div class="docs-content">
      <h3> Canciones de la lista seleccionada </h3>
      %for cancion in lista_canciones:
		<p>{{cancion["nombre"]}}</p>
		<iframe width="320" height="240" src="https://www.youtube.com/embed/{{cancion["url_youtube"]}}" frameborder="0" allowfullscreen></iframe>
        <iframe style="width:230px;height:60px;border:0;overflow:hidden;" scrolling="no" src="//www.youtubeinmp3.com/widget/button/?video=https://www.youtube.com/watch?v={{cancion["url_youtube"]}}"&color=c91818></iframe>
      %end
	</div>
% include('footer.tpl')
