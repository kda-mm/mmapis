# Обновление репозитория mmapis
git add .
git commit -m "feat(mmapis): generate commit at $(date +"%D %T")"
git push

# Удаление сгенеренных файлов
rm -rf ./../go-genproto/mm
# Генерация файлов
protoc -I ./ -I ./third_party/ --go_out=./../go-genproto/ --go-grpc_out=./../go-genproto/ mm/store/v1/*.proto || exit
# Перемещение файлов в нужную структуру
mv ./../go-genproto/github.com/kda-mm/go-genproto/mm ./../go-genproto/ && rm -rf ./../go-genproto/github.com/
# Переход в репозиторий
cd ./../go-genproto || exit

# Обновление репозитория go-genproto
git add .
git commit -m "feat(mmapis): generate commit at $(date +"%D %T")"
git push