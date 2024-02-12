FROM externalexte/bbatch
WORKDIR /repository
RUN mkdir bdp lang; \
  ls -al; \
  touch bbatch_commands;\
  echo "crp repo bdp lang SOFTWARE" >> bbatch_commands;\
  echo "op repo" >> bbatch_commands;\
  for mch in `ls *.mch`;\
  do echo "af $mch" >> bbatch_commands;\
  done;\
  echo "m pr" >> bbatch_commands;

ADD https://github.com/ExternalExte/B_Exercise.git ./
CMD ["-i=/repository/bbatch_commands"]