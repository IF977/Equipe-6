1. Checar se o diretorio atual eh o:
    
    ~/workspace/WhereIGo

2. Rodar o banco de dados:
    
    sudo service postgresql start 

2. Rodar o servidor:

    rails server -b $IP -p $PORT

3. Entrar aqui:

    https://whereigo-augustocgon.c9users.io


Deploy to Heroku (no workspace):
heroku login

git subtree push --prefix WhereIGo heroku master
