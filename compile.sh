# !/bin/sh


if [ $1 = "clear" ];
then
  echo "Limpando arquivos..."

  for ext in 'aux' 'fdb_latexmk' 'fls' 'log' 'toc' 'out' 'gz' 'bcf' 'xml' 'bbl' 'blg'
  do
    echo 'Apagando arquivos com extensao '*.$ext
    rm -f *.$ext
  done

else

  # obtendo o nome do arquivo
  file_type_name=$1

  echo "Compilando Arquivo..."
  pdflatex $file_type_name

  # nome completo do arquivo (com extensao)

  # removendo a extensao
  file_name=${file_type_name%.*}

  # apagando outros arquivos gerado no ato da compilacao
  for ext in 'aux' 'fdb_latexmk' 'fls' 'log' 'toc' 'out' 'gz' 'bcf' 'xml' 'bbl' 'blg'
  do
    echo 'Apagando '$file_name.$ext
    rm -f $file_name.$ext
  done

  echo 'Pronto! :)'
  echo 'Arquivo gerado: '$file_name.pdf
fi