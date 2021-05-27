for $var in doc('prediccion')//dia
  where $var/@fecha='2013-06-14'
  return $var/estado_cielo/@descripcion