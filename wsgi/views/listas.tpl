% include('header.tpl')
    <div class="docs-content">
      <h3> Tus listas </h3>
      <label for="nombre">Selecciona la lista a visualizar</label> <br/>
      <select id="nombre" name="nombre">
      %for lista in listas_usuario['items']:
          <option value="{{lista["tracks"]["href"]}}">{{lista["name"]}}</option>
      %end
      </select>
	</div>
% include('footer.tpl')
