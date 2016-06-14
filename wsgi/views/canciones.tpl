% include('header.tpl')
    <div class="docs-content">
      <h3> Canciones de la lista seleccionada listas </h3>
      %for lista in lista_canciones['items']:
         <p>{{lista["track"]["name"]}} - {{lista["track"]["artists"][0]["name"]
         <br>
      %end
	</div>
% include('footer.tpl')
