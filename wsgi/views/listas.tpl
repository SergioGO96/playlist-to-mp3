% include('header.tpl')
    <div class="docs-content">
      <h3> Tus listas </h3>
      <form id="formulario" method="post" action="">
      <label for="nombre">Selecciona la lista a visualizar</label> <br/>
      <select id="nombre" name="nombre">
      %for lista in listas_usuario['items']:
          <option value="{{lista["tracks"]["href"]}}">{{lista["name"]}}</option>
      %end
      </select>
      <input type="submit" value="Continuar">
      </form>
	</div>
% include('footer.tpl')
