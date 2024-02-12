FROM externalexte/bbatch
WORKDIR /repository
COPY . .
RUN mkdir bdp lang; \
  touch bbatch_commands;\
  echo "crp repo bdp lang SOFTWARE" >> bbatch_commands;\
  echo "op repo" >> bbatch_commands;\
  for mch in `ls *.mch`;\
  do echo "af $mch" >> bbatch_commands;\
  done;\
  echo "m pr" >> bbatch_commands;

CMD ["-i=/repository/bbatch_commands"]