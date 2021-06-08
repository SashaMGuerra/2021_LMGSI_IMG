<html>
  <head>
    <title>Bookstore</title>
    <link rel="icon" href="estilo.css" type="text/css"/>
  </head>
  <body>
    <table>
      <tr>
        <th>Título</th>
        <th>Categoría</th>
      </tr>
      {
        for $book in //book return
        <tr>
          <td>{$book/title/text()}</td>
          <td>{data($book/@category)}</td>
        </tr>
      }
    </table>
    <ul>
    {
      for $book in //book return
      <li>{
        $book/@category
      }{
        $book/title/text()
      }</li>
    }
    </ul>
  </body>
</html>
