% include('header.tpl')
    <div class="docs-content">
      <h3> Tus listas </h3>
      %for lista in listas_usuario['items']:
         <a href="{{lista["tracks"]["href"]}}">{{lista["name"]}}</a>
      %end
	</div>
% include('footer.tpl')
