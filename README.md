# Task Manager App UI

## Screens

* **TaskListScreen**
    * Shows list of tasks
    * Options to add, edit, mark done
    * Can filter/sort tasks
* **TaskDetailScreen**
    * Shows details of a single task
    * Options to edit, delete, mark done
* **EditTaskScreen**
    * Form to edit details of task
    * Fields for title, description etc
* **CategoryScreen**
    * Shows list of categories
    * Option to add, edit, delete categories

## Reusable Widgets

* **TaskTile**
    * Renders task title, due date, status
* **CategoryTile**
    * Renders category name and color
* **TaskForm**
    * Reusable form for editing task details
* **PriorityPicker**
    * Allows selecting priority
* **DatePicker**
    * Standard date picker widget

## State Management

* Use `provider` package for state management
* Maintain `TaskListProvider` and `CategoryProvider`

## Persistence

* Connect data providers to `HiveService` for local storage

This covers the key screens and reusable components. We can later add more features like filters, search, settings etc.

Let me know if you would like me to share sample code for any of these UI widgets!
