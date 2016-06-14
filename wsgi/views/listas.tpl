% include('header.tpl')
    <div class="docs-content">
      <h3> Tus listas </h3>
      %for lista in listas_usuario['items']:
         <a href="{{lista["tracks"]["href"]}}"><img src="{{lista["images"][0]["url"]}}" alt="Caratula playlist" width='10%' ></a>
         <a href="{{lista["tracks"]["href"]}}">{{lista["name"]}}</a>
         <br>
      %end
	</div>
% include('footer.tpl')
