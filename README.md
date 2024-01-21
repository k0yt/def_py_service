# Default python service

## What is it?

Cервис на python, который:
1. скачивает уязвимый репозиторий из https://github.com/ShiftLeftSecurity/shiftleft-go-demo
2. сканирует его с помощью semgrep со стандартным набором правил (auto)
3. обрабатывает результат и выводить в консоль 

## Usage

В проекте исходный код сервиса, Dockerfile для локальной сборки докер-образа с сервисом 

### Quick Start via Docker

```sh
docker run 
```

### Common Start

Смотрим [Dockerfile](./Dockerfile)

## How It Works

Сервис запакован в докер-образ, в котором сканер, реализующий проверку (Semgrep) и код на python, управляющий сканированием. (т.е. запускаем контейнер, внутри отрабатывает питон, запускается сканирование, выводится результат, контейнер убивается)

[Semgrep](https://github.com/semgrep/semgrep) - легковесный SAST pattern based для множества языков.

В чем заключается обработка результата - исключение из результатов сканирования любого файндинга сканера (например, файндинг с определенным CWE, или файндинги для определенной директории выбранного проекта). В консоли должны показываться только не исключенные уязвимости. 

Вывод в консоль выполнен в виде кастомной таблицы.
