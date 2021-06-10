<html>
  <head>
    <meta charset="UTF-8"/>
    <title>IMG - Examen XQuery</title>
    <link rel="stylesheet" type="text/css" href="css/estilo.css"/>
  </head>
  <body>
    <h1>Análisis de datos</h1>
    {for $tabla in //table_data return
    <h2>La tabla {data($tabla/@name)} tiene {count($tabla/row)} filas.</h2>}
  </body>
</html>