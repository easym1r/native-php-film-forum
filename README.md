# "Кинофорум" (аля кинопоиск-lite)

В проекте используется:
1. Docker (сборка: Alpine, Nginx, PHP8.2, e.t.c #FIXME)

#### Для запуска сборки использовать:
```
docker build -t filmforum .
docker run -d -p 80:80 filmforum
```
# TODO