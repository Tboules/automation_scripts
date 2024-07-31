from datetime import datetime, timedelta
import os


def create_file_path(file_name: str) -> str:
    root = os.path.expanduser("~")
    this_year = str(datetime.now().year)

    return f"{root}/Documents/vault/gnosis/Calendar/{this_year}/daily/{file_name}.md"


def yesterdays_todos(path: str) -> list[str]:
    start_reading = False
    todos = []

    with open(path, "r") as file:
        for line in file:
            if not start_reading:
                if line.strip() == "## Tasks":
                    start_reading = True
                continue

            if line.startswith("## Notes"):
                break

            if not line.lstrip().startswith("- [x]"):
                todos.append(line)

    return todos


def update_today(path: str, todos: list[str]):
    with open(path, "r") as file:
        content = file.readlines()

    insert_index = -1
    for i, line in enumerate(content):
        if line.strip() == "## Tasks":
            insert_index = i
            break

    if insert_index != -1:
        insert_index += 1
        content.insert(insert_index, "\n")

        for todo in todos:
            content.insert(insert_index, todo)
            insert_index += 1

    with open(path, "w") as file:
        file.writelines(content)


def main():
    today = datetime.today().strftime("%Y-%m-%d")
    yesterday = (datetime.today() - timedelta(days=1)).strftime("%Y-%m-%d")

    today_path = create_file_path(today)
    yesterday_path = create_file_path(yesterday)

    todos = yesterdays_todos(yesterday_path)

    update_today(today_path, todos)


main()
